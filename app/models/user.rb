# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :vehicles, dependent: :destroy
  has_many :rides, through: :vehicles

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
end
