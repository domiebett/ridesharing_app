# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @rides = Ride.where("departure_date > ?", 1.day.ago)
                 .order(created_at: :desc).to_a
    @rides.select! { |ride| ride.capacity_left > 0 }
  end
end
