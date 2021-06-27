class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    @state = user.save
  end

  private

  def user_params
    params.permit(:name, :email, :password, :usertype)
  end
end