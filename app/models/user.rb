class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :vehicles

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_vehicle(params)
    vehicles.build(params)
  end
end
