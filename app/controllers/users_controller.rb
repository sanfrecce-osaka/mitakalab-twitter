class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by(username: params[:username])
  end

  def edit
    @user = User.find_by(username: params[:username])
  end

  def update
    @user = User.find_by(username: params[:username])
    @user.update(user_params)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :location, :about)
  end
end
