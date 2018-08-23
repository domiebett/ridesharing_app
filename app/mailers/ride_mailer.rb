class RideMailer < ApplicationMailer
  default from: 'bettdominic1@gmail.com'

  def ride_request_sent
    puts params, 'boom'
    @recipient = params[:recipient]
    @user = params[:args][:user]
    @url = "http://localhost:3000/#{params[:path]}"
    mail(to: @recipient.email, subject: 'Someone requested to join your ride.')
  end

  def ride_request_accepted
    @recipient = params[:recipient]
    @url = "http://localhost:3000/#{params[:path]}"
    mail(to: @recipient.email, subject: 'Your ride request was accepted.')
  end
end
