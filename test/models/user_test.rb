# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.new(
      first_name: 'Dominic',
      last_name: 'Bett',
      email: 'email@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid user without first name' do
    @user.first_name = nil
    refute @user.valid?
    assert_not_nil @user.errors[:first_name]
  end

  test 'invalid user without last name' do
    @user.last_name = nil
    refute @user.valid?
    assert_not_nil @user.errors[:last_name]
  end

  test 'invalid user without valid email' do
    @user.email = nil
    refute @user.valid?
    @user.email = 'invalidemail'
    refute @user.valid?

    assert_not_nil @user.errors[:email]
  end

  test 'invalid user without password' do
    @user.password = nil
    refute @user.valid?
    assert_not_nil @user.errors[:password]
  end

  test 'invalid user without correct password confirmation' do
    @user.password_confirmation = 'not confirmed'
    refute @user.valid?
    assert_not_nil @user.errors[:password_confirmation]
  end
end
