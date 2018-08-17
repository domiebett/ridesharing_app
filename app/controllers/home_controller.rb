# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @rides = Ride.where("departure_date > ?", 1.day.ago)
  end
end
