# frozen_string_literal: true

class RideRequestController < ApplicationController
  before_action :set_ride
  before_action :set_ride_request, only: %i[update destroy]

  def index; end

  def create
    @ride_request = current_user.create_ride_request(@ride)
    respond_to do |format|
      if @ride_request.save
        format.html do
          redirect_to home_index_url,
                      notice: 'Request sent. Await driver confirmation'
        end
      end
    end
  end

  def update
    @ride_request.accepted = true;
    respond_to do |format|
      if @ride_request.save
        format.html do
          user = User.find(params[:user_id])
          redirect_to @ride, notice: "#{user.first_name} successfully joined your ride."
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      if @ride_request.destroy
        format.html do
          redirect_to home_index_url,
                      notice: 'Request cancelled successfully'
        end
      end
    end
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
end
