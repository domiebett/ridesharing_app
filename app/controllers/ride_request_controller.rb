# frozen_string_literal: true

class RideRequestController < ApplicationController
  include MailHelper

  before_action :set_ride, except: %i[index]
  before_action :prevent_creating_full_rides, only: %i[create]
  before_action :prevent_accepting_full_ride, only: %i[update]
  before_action :set_ride_request, only: %i[update destroy]

  def index
    @rides = current_user.requested_rides
  end

  def create
    @ride_request = current_user.create_ride_request(@ride)
    create_resource(@ride_request, home_index_url,
                    'Request sent. Await driver confirmation')

    Notification.create(recipient: @ride.owner, actor: current_user,
                        action: "#{current_user.full_name} requested to join your ride",
                        path: "/rides/#{@ride.id}", notifiable: @ride)

    send_mail(@ride.owner, "/rides/#{@ride.id}", user: current_user)
      .ride_request_sent.deliver_later
  end

  def update
    update_resource(
      @ride_request, { accepted: params[:accepted] }, @ride,
      "#{@ride_request.user.first_name} successfully joined your ride."
    )

    Notification.create(recipient: @ride_request.user, actor: current_user,
                        action: 'Your ride request was accepted',
                        path: "/rides/#{@ride.id}", notifiable: @ride)
    send_mail(@ride_request.user, "/rides/#{@ride.id}")
      .ride_request_accepted.deliver_later
  end

  def destroy
    destroy_resource(
      @ride_request, home_index_url, 'Request cancelled successfully'
    )
  end

  def set_ride
    @ride = Ride.find(params[:ride_id])
  end

  def set_ride_request
    @ride_request = @ride.ride_requests.find_by(user_id: params[:user_id])
  end

  def ride_request_params
    params.require(:ride_request).permit(:accepted, :ride_id, :user_id, :id)
  end

  def prevent_creating_full_rides
    unless @ride.capacity_left.positive?
      redirect_to home_index_path, notice: 'That ride is full.'
    end
  end

  def prevent_accepting_full_ride
    if params[:accepted] && !@ride.capacity_left.positive?
      redirect_to @ride, notice: 'This ride is full'
    end
  end
end
