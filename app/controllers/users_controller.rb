# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :enforce_admin_only_access
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    destroy_resource @user, users_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
