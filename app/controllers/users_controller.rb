class UsersController < ApplicationController
  #ユーザ作成時以外は認証を必須とする（トークン認証）
  skip_before_action :require_login, only: [:create]

  # ユーザ一覧表示（情報込み） - GET /api/users
  def index
    # 権限を確認 (ability.rbに権限情報記載済み)
    if can? :read, current_user
      @users = User.all
    end
  end

  # ユーザ情報一件表示 - GET /api/users/:id
  def show
    #権限を確認 (ability.rbに権限情報記載済み)
    if can? :read, current_user
      @user = User.find(params[:id])
    end
  end
  # 自分の情報を取得 - GET /api/getAccountInfo
  def me
    @user = current_user
  end



  #更新系-------

  # ユーザ情報更新(管理者用ID指定) - PATCH /api/users/:id
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

  #自分のユーザ情報の変更 - POST /api/deleteAccount
  def updateme
    current_user.update(user_params)
    #パラメータdeveloperが1の場合
    if user_ability_params[:developer].to_i == 1
      current_user.update(role: 3)
    else
      current_user.update(role: 2)
    end
    @state = current_user.save
  end


  #作成系------

  # ユーザアカウント作成 - POST /api/signup/ or POST /api/users/
  def create
    user = User.new(user_params)
    #パラメータdeveloperが1の場合
    if user_ability_params[:developer].to_i == 1
      user.role = 3
    else
      user.role = 2
    end
    @state = user.save
  end


  # 削除系------

  # アカウント削除（ID指定、管理者向け） DELETE /api/users/1
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

  # アカウント削除(退会) - POST /api/deleteAccount
  def deleteme
    @state = current_user.destroy
  end


  private
  #ストロングパラメータ

  def user_ability_params
    params.permit(:developer)
  end
  def user_params
    params.permit(:name, :email, :password)
  end
end