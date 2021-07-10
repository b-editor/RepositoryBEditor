class AuthController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    user = User.find_by(email: params[:email])
    @token = ''
    @status = :unauthorized
    if user && user.authenticate(params[:password])
      @token = Session.create(user)
      @status = :authorized
    end
  end
end
