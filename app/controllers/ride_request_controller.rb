# frozen_string_literal: true

class RideRequestController < ApplicationController
  include MailHelper

  before_action :set_ride
  before_action :prevent_creating_full_rides, only: %i[create]
  before_action :prevent_accepting_full_ride, only: %i[update]
  before_action :set_ride_request, only: %i[update destroy]

  def index; end

  def create
    @ride_request = current_user.create_ride_request(@ride)
    create_resource(@ride_request, home_index_url,
                    'Request sent. Await driver confirmation')

    send_mail(@ride.owner, "/rides/#{@ride.id}", user: current_user)
      .ride_request_sent.deliver_later
  end

  def update
    update_resource(
      @ride_request, { accepted: params[:accepted] }, @ride,
      "#{@ride_request.user.first_name} successfully joined your ride."
    )

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
