class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]

  # 一覧表示
  def index
    @users = User.all
  end
  # 一件表示
  def show
    @user = User.find(params[:id])
  end
  # 更新
  def update
    user = User.find(params[:id])
    if user == current_user
      @state = user.update(user_params)
    elsif can? :update, current_user
      @state = user.update(user_params)
    else
      @state = :unauthorized
    end
  end
  # 作成
  def create
    user = User.new(user_params)
    if user_ability_params == 1
      user.role = 3
    else
      user.role = 2
    end
    @state = user.save
  end
  # 削除
  def destroy
    user = User.find(params[:id])
    if user == current_user
      @state = user.destroy
    elsif can? :destroy, current_user
      @state = user.destroy
    else
      @state = :unauthorized
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