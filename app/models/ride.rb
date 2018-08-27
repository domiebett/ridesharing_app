# frozen_string_literal: true

class Ride < ApplicationRecord
  validates :origin, :destination, :departure_date, :departure_time,
            :description, presence: true

  belongs_to :vehicle
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :ride_requests, dependent: :destroy
  has_many :requesters, through: :ride_requests, class_name: 'User', source: :user

  scope :filter_origin, ->(origin) { where('lower(origin) like ?', "%#{origin.downcase}%") }
  scope :filter_destination, ->(destination) { where('lower(destination) like ?', "%#{destination.downcase}%") }

  def capacity_left
    accepted_users_count = ride_requests.where('accepted': true).count
    vehicle ? vehicle.capacity - accepted_users_count : 0
  end
end
