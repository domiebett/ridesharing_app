require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:two)
  end

  test "should get index" do
    get "#{notifications_path}.json"
    assert_response :success
  end

  test "should mark_as_read" do
    get read_notifications_path(id: notifications(:one).id)
    assert_response :success
  end

end
