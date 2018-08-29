# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :fetch_rides
  after_action :remove_full_rides

  def index; end

  def filter
    @rides = @rides.filter_origin(params[:origin]) if params[:origin].present?
    @rides = @rides.filter_destination(params[:destination]) if params[:destination].present?

    respond_to do |format|
      format.js
    end
  end

  def fetch_rides
    @rides = Ride.where('departure_date > ?', 1.day.ago)
                 .where('owner_id != :user_id', user_id: current_user.id)
                 .order(created_at: :desc)
  end

  def remove_full_rides
    @rides.to_a.select! do |ride|
      ride.capacity_left.positive? && (ride.owner != current_user)
    end
  end
end
