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

  def update; end

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
    @ride_request = @ride.ride_requests.first
  end

  def ride_request_params
    params.require(:ride_request).permit(:accepted, :ride_id, :id)
  end
end
