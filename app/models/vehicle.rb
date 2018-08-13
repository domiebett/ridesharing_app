class Vehicle < ApplicationRecord
  validates :vehicle_model, :license_plate, :capacity, presence: true
  validates :license_plate, uniqueness: true

  belongs_to :user
  has_many :rides, dependent: :nullify
end
