# frozen_string_literal: true

class VehiclesController < ApplicationController
  before_action :owner_or_admin?
  before_action :set_vehicle, only: %i[show edit update destroy]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = @requester_is_admin ? Vehicle.all : current_user.vehicles
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

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = if @requester_is_admin
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
