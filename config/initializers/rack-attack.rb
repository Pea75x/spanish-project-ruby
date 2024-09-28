class Rack::Attack
  Rack::Attack.enabled = ENV['ENABLE_RACK_ATTACK'] || Rails.env.production?
  
  ### Throttle Spammy Clients ###
  throttle('req/ip', limit: 300, period: 5.minutes) do |req|
    req.ip 
  end

  ### Prevent Brute-Force Login Attacks ###
  throttle('logins/email', limit: 3, period: 20.seconds) do |req|
    if req.path == '/auth/login' && req.post?
      body = JSON.parse(req.body.string) rescue {}
      body.dig("auth", "email").downcase
    end
  end

  Rack::Attack.blocklist("blocks unknown routes") do |req|
    Rack::Attack::Fail2Ban.filter("banlist:#{req.ip}", maxretry: 3, findtime: 10.minutes, bantime: 2.hours) do
      !Rails.application.routes.recognize_path(req.path, method: req.request_method) rescue false
    end
  end
end