class AuthController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authorize, only: [:login]

  def login
    user = User.where(username: auth_params[:username]).first

    if user.present? && user.authenticate(auth_params[:password])
      @token = JWT.encode({user_id: user.id, admin: user.admin }, ENV["SECRET_KEY"])

      render json: { token: @token }, status: :ok
    else
      render json: "Bad credentials", status: :unauthorized
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:username, :password)
  end
end