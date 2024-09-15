class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.create(user_params)

    if user.save
      @token  = JWT.encode({ user_id: user.id }, ENV["SECRET_KEY"] )

      render json: {token: @token }, status: :created
    else
      render json: { message: user.errors.messages }, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end