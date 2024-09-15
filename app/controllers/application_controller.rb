class ApplicationController < ActionController::Base
  before_action :authorize

  def token
    token_data = begin
      auth_header = request.authorization
      token = auth_header.split(" ")[-1] if auth_header.present? && auth_header.match(/^Bearer/i)
      decoded_token = JWT.decode(token, ENV["SECRET_KEY"], true, algorithm: 'HS256')
    rescue StandardError
      {}
    end
  end

  def current_user
    if token.present?
      user_id = token[0]['user_id']
      @user = User.find(user_id)
    end
  end

  def authorize
    render json: { message: "Please log in"}, status: :unauthorized unless current_user.present?
  end
end
