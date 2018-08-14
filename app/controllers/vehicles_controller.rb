# frozen_string_literal: true

class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show edit update destroy]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = current_user.is_admin ? Vehicle.all : current_user.vehicles
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show; end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit; end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = current_user.create_vehicle(vehicle_params)

    create_resource @vehicle
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    update_resource @vehicle, vehicle_params
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    destroy_resource @vehicle, vehicles_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = if current_user.is_admin
                 Vehicle.find(params[:id])
               else
                 current_user.vehicles.find(params[:id])
               end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vehicle_params
    params.require(:vehicle).permit(:vehicle_model, :license_plate, :capacity)
  end
end
