# frozen_string_literal: true

require 'test_helper'

class RideRequestControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @ride = rides(:one)
    @ride_request = ride_requests(:one)
  end

  test 'should create' do
    assert_difference('RideRequest.count') do
      post new_ride_request_url(ride_id: @ride.id)
    end
    assert_redirected_to home_index_path
  end

  test 'should destroy' do
    delete destroy_ride_request_url(ride_id: rides(:two).id)
    assert_redirected_to home_index_path
  end

  test 'should update' do
    put update_ride_request_url(ride_id: @ride.id, id: @ride_request.id)
    assert_response :success
  end
end
