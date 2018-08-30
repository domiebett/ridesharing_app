# frozen_string_literal: true

require 'test_helper'

class RideTest < ActiveSupport::TestCase
  setup do
    @ride = Ride.new(
      origin: 'Kenya',
      destination: 'Nigeria',
      departure_date: '2018-08-31',
      departure_time: '12:00pm',
      description: 'Description',
      vehicle: vehicles(:one),
      owner: users(:one)
    )
  end

  test 'valid ride' do
    assert @ride.valid?
  end

  test 'invalid ride without origin' do
    @ride.origin = nil
    assert @ride.invalid?
    assert_not_nil @ride.errors[:origin]
  end

  test 'invalid ride without destination' do
    @ride.destination = nil
    assert @ride.invalid?
    assert_not_nil @ride.errors[:destination]
  end

  test 'invalid ride without departure data and time' do
    @ride.departure_date = nil
    @ride.departure_time = nil
    assert @ride.invalid?
    assert_not_nil @ride.errors[:departure_time]
    assert_not_nil @ride.errors[:departure_date]
  end

  test 'invalid ride without description' do
    @ride.description = nil
    assert @ride.invalid?
    assert_not_nil @ride.errors[:description]
  end
end
