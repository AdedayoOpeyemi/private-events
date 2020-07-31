class SessionsController < ApplicationController
  include SessionsHelper

  before_action :require_logout, only: %w[new create]

  def new
    render 'sessions/new'
  end

  def create
    username = params[:username].presence
    user = username.nil? ? nil : User.find_by(username: username)

    if user
      login(user)
      redirect_to root_path
    else
      redirect_back fallback_location: '/', alert: 'User not found'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
