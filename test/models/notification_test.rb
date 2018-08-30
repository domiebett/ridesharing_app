require 'test_helper'

class NotificationTest < ActiveSupport::TestCase

  setup do
    @notification = notifications(:one)
  end

  test 'associations' do
    assert_equal @notification.recipient, users(:two)
    assert_equal @notification.actor, users(:one)
  end

  test 'scopes' do
    assert_includes Notification.unread, notifications(:one)
  end
end
