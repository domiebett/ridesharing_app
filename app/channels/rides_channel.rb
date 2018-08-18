# frozen_string_literal: true

class RidesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rides'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
