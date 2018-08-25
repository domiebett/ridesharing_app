require 'test_helper'

require 'devise'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get home_index_path
    assert_response :success
  end
end
