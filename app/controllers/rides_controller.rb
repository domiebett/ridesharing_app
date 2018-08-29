# frozen_string_literal: true

class RidesController < ApplicationController
  before_action :set_ride, only: %i[edit update destroy]

  # GET /rides
  # GET /rides.json
  def index
    @rides = current_user.is_admin ? Ride.all : current_user.owned_rides
    @rides = @rides.order(created_at: :desc).to_a
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
    @ride = Ride.find(params[:id])
  end

  # GET /rides/new
  def new
    if current_user.vehicles.empty?
      redirect_to new_vehicle_path, alert: 'You must have a vehicle to create a ride'
    end
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit; end

  # POST /rides
  # POST /rides.json
  def create
    @ride = current_user.create_ride(ride_params)
    create_resource @ride
  end

  # PATCH/PUT /rides/1
  # PATCH/PUT /rides/1.json
  def update
    update_resource @ride, ride_params
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
    destroy_resource @ride, rides_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ride
    if current_user.is_admin
      @ride = Ride.find(params[:id])
      return
    end

    @ride = current_user.owned_rides.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ride_params
    params.require(:ride).permit(:origin, :destination,
                                 :departure_date, :departure_time,
                                 :description, :vehicle_id)
  end
end
