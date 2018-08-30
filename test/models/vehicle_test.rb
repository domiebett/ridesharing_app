# frozen_string_literal: true

require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  setup do
    @vehicle = Vehicle.new(
      vehicle_model: 'Subaru Forester',
      license_plate: 'KBZ 190F',
      capacity: 4,
      user: users(:one)
    )
  end

  test 'valid vehicle' do
    assert @vehicle.valid?
  end

  test 'invalid vehicle without model' do
    @vehicle.vehicle_model = nil
    assert @vehicle.invalid?
    assert_not_nil @vehicle.errors[:vehicle_model]
  end

  test 'invalid vehicle without license plate' do
    @vehicle.license_plate = nil
    assert @vehicle.invalid?
    assert_not_nil @vehicle.errors[:license_plate]
  end

  test 'invalid vehicle wihout capacity' do
    @vehicle.capacity = nil
    assert @vehicle.invalid?
    assert_not_nil @vehicle.errors[:capacity]
  end
end
