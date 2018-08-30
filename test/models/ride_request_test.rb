require 'test_helper'

class RideRequestTest < ActiveSupport::TestCase
  test 'associations' do
    assert_equal users(:one).ride_requests.count, 1
    assert_equal rides(:two).ride_requests.count, 2
  end
end
