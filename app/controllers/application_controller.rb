# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :first_name,
        :last_name,
        :email, :password,
        :password_confirmation
      )
    end
  end

  def enforce_admin_only_access
    unless current_user.is_admin?
      redirect_to '/', alert: 'You are not authorized for this functionality'
    end
  end
end
