require 'test_helper'

class RidesControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @ride = rides(:one)
  end

  test "should get index" do
    get rides_url
    assert_response :success
  end

  test "should get new" do
    get new_ride_url
    assert_response :success
  end

  test "should create ride" do
    assert_difference('Ride.count') do
      post rides_url, params: { ride: { departure_date: @ride.departure_date, departure_time: @ride.departure_time, description: @ride.description, destination: @ride.destination, origin: @ride.origin, vehicle_id: @ride.vehicle_id } }
    end

    assert_redirected_to ride_url(Ride.last)
  end

  test "should show ride" do
    get ride_url(@ride)
    assert_response :success
  end

  test "should get edit" do
    get edit_ride_url(@ride)
    assert_response :success
  end

  test "should update ride" do
    patch ride_url(@ride), params: { ride: { departure_date: @ride.departure_date, departure_time: @ride.departure_time, description: @ride.description, destination: @ride.destination, origin: @ride.origin, vehicle_id: @ride.vehicle_id } }
    assert_response :success
  end

  test "should destroy ride" do
    assert_difference('Ride.count', -1) do
      delete ride_url(@ride)
    end

    assert_redirected_to rides_url
  end
end
