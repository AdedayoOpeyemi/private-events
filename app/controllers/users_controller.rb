class UsersController < ApplicationController
  include SessionsHelper
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_login, except: %i[new create]
  before_action :require_logout, only: %i[new create]

  def show; end

  def new
    @user = User.new
  end

  def edit
    redirect_to root_path if @user != logged_user
  end

  def profile
    @user = logged_user
    render 'users/show'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login @user
      redirect_to root_path
    else
      redirect_back fallback_location: '/', alert: 'Fail.'
    end
  end

  def update
    if @user == logged_user
      redirect_to :edit unless @user.update(user_params)
    end

    redirect_to root_path
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :name)
  end
end
