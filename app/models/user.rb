# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :vehicles, dependent: :destroy

  has_many :owned_rides, foreign_key: 'owner_id', class_name: 'Ride'

  has_many :ride_requests, dependent: :destroy
  has_many :requested_rides, through: :ride_requests, class_name: 'Ride', source: :ride

  has_many :notifications, foreign_key: 'recipient_id'

  def vehicles_hash
    vehicles_hash = {}
    vehicles.each do |vehicle|
      vehicles_hash[vehicle.vehicle_model] = vehicle.id
    end

    vehicles_hash
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_vehicle(params)
    vehicles.build(params)
  end

  def create_ride(params)
    owned_rides.build(params)
  end

  def create_ride_request(ride)
    requests = ride_requests.find_by(ride_id: ride.id)
    ride_requests.build(ride_id: ride.id) if requests.nil?
  end

  def requested_ride?(ride)
    !ride_requests.find_by(ride_id: ride.id).nil?
  end

  def accepted_ride_request?(ride)
    ride_requests.find_by(ride_id: ride.id).accepted
  end
end
