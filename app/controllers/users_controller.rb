class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    binding.pry
    user = User.new(user_params)
    if user_ability_params == 1
      user.role = 3
    else
      user.role = 2
    end
    @state = user.save
  end

  def destroy
    user = User.find(params[:id])
    if user == current_user
      user.destroy
    elsif can? :destroy, User
      user.destroy
    end
  end

  private

  def user_ability_params
    params.permit(:developer)
  end
  def user_params
    params.permit(:name, :email, :password)
  end
end