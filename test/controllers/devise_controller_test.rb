# frozen_string_literal: true

require 'test_helper'

class DeviseControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = {
      first_name: 'Dominic',
      last_name: 'Bett',
      email: 'dbett49@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    }
  end

  test 'get register user page' do
    get new_user_registration_path
    assert_response :success
  end

  test 'get login user page' do
    get new_user_session_path
    assert_response :success
  end

  test 'create session' do
    post user_session_path, params: { email: 'dbett49@gmail.com', password: 'password' }
    assert_response :success
  end

  test 'register user' do
    post user_registration_path, params: {
      first_name: 'Dominic',
      last_name: 'Bett',
      email: 'bett@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    assert_response :success
  end

  test 'register existent user fails' do
    post user_registration_path, params: { user: @user }

    assert_match 'Email has already been taken', response.body
  end

  test 'login wrong password fails' do
    post user_session_path,
         params: { email: 'dbett49@gmail.com', password: 'wrongpassword' }

    assert_match 'Invalid Email or password', response.body
  end

  test 'non logged in user cannot access app' do
    get home_index_path

    assert_redirected_to new_user_session_path
  end

  test 'logout' do
    delete destroy_user_session_path, params: { id: 1 }

    assert_redirected_to home_index_path

    follow_redirect!

    assert_redirected_to new_user_session_path
  end
end
