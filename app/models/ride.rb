class Ride < ApplicationRecord
  validates :origin, :destination, :departure_date, :departure_time,
            :description, presence: true

  belongs_to :vehicle
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :ride_requests, dependent: :destroy
  has_many :requesters, through: :ride_requests, class_name: 'User', source: :user

  def capacity_left
    accepted_users_count = ride_requests.where('accepted': true).count
    vehicle ? vehicle.capacity - accepted_users_count : 0
  end
end
