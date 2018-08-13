# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  test 'non-admin cant destroy user' do
    sign_in users(:two)
    assert_difference('User.count', 0) do
      delete user_url(@user)
    end
  end

  test 'non-admin cant view users' do
    sign_in users(:two)

    get users_url

    assert_redirected_to home_index_path

    follow_redirect!

    assert_match 'You are not authorized for this functionality', @response.body
  end
end
