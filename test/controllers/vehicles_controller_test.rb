# frozen_string_literal: true

require 'test_helper'
require 'devise'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @vehicle = vehicles(:one)
  end

  test 'should get index' do
    get vehicles_url
    assert_response :success
  end

  test 'should get new' do
    get new_vehicle_url
    assert_response :success
  end

  test 'should create vehicle' do
    assert_difference('Vehicle.count') do
      post vehicles_url, params: { vehicle: { capacity: @vehicle.capacity, license_plate: 'VHL 300B', vehicle_model: @vehicle.vehicle_model } }
    end

    assert_redirected_to vehicle_url(Vehicle.last)
  end

  test 'should show vehicle' do
    get vehicle_url(@vehicle)
    assert_response :success
  end

  test 'should get edit' do
    get edit_vehicle_url(@vehicle)
    assert_response :success
  end

  test 'should update vehicle' do
    patch vehicle_url(@vehicle), params: { vehicle: { capacity: @vehicle.capacity, license_plate: 'EDIT PLATES', vehicle_model: @vehicle.vehicle_model } }
    assert_response :success
  end

  test 'should destroy vehicle' do
    assert_difference('Vehicle.count', -1) do
      delete vehicle_url(@vehicle)
    end

    assert_redirected_to vehicles_url
  end
end
