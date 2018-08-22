# frozen_string_literal: true

module MailHelper
  def send_mail(recipient, path, args = {})
    RideMailer.with(
      recipient: recipient,
      path: path,
      args: args
    )
  end
end
