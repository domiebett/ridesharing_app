class Ride < ApplicationRecord
  validates :origin, :destination, :departure_date, :departure_time,
            :description, presence: true

  belongs_to :vehicle
end
