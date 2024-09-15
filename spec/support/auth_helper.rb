module AuthHelper
  def authenticated_header(user)
    {
      "Authorization" => "Bearer #{authenticated_token(user)}"
    }
  end

  def authenticated_token(user = nil)
    return if user.blank? || user.id.blank?

    JWT.encode({user_id: user.id}, ENV["SECRET_KEY"])
  end
end

RSpec.configure do |config|
  config.include AuthHelper
end