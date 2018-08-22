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
    unless current_user.is_admin
      redirect_to '/', alert: 'You are not authorized for this functionality'
    end
  end

  def create_resource(resource, redirect_uri = nil, notice = nil)
    notice = "#{resource.class} was successfully created." if notice.nil?
    redirect_uri = resource if redirect_uri.nil?
    respond_to do |format|
      if resource.save
        format.html { redirect_to redirect_uri, notice: notice }
        format.json { render :show, status: :created, location: resource }
      else
        format.html { render :new }
        format.json { render json: resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_resource(resource, params, redirect_uri = nil, notice = nil)
    notice = "#{resource.class} was successfully updated." if notice.nil?
    redirect_uri = resource if redirect_uri.nil?
    respond_to do |format|
      if resource.update(params)
        format.html { redirect_to redirect_uri, notice: notice }
        format.json { render :show, status: :ok, location: resource }
      else
        format.html { render :edit }
        format.json { render json: resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_resource(resource, redirect_uri = nil, notice = nil)
    notice = "#{resource.class} was successfully destroyed." if notice.nil?
    redirect_uri = resource if redirect_uri.nil?
    resource.destroy
    respond_to do |format|
      format.html { redirect_to redirect_uri, notice: notice }
      format.json { head :no_content }
    end
  end
end
