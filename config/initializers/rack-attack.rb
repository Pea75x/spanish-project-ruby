class Rack::Attack
  if ENV["ENABLE_RACK_ATTACK"] == 'true'

    Rack::Attack.blocklist("blocks unknown routes") do |req|
      Rack::Attack::Fail2Ban.filter("banlist:#{req.ip}", maxretry: 5, findtime: 10.minutes, bantime: 2.hours) do
        if !(Rails.application.routes.recognize_path(req.path, method: req.request_method) rescue false)
          Rails.logger.info "[Rack::Attack] Blocking request from: #{req.ip} for unknown route: #{req.path}"
          true
        end
      end
    end

    ### Throttle Spammy Clients ###
    throttle('req/ip', limit: 300, period: 5.minutes) do |req|
      # Only log when the request is actually throttled
      Rails.logger.info "[Rack::Attack] Request from: #{req.ip}, route: #{req.path}"
      req.ip 
    end

    ### Prevent Brute-Force Login Attacks ###
    throttle('logins/email', limit: 3, period: 2.minutes) do |req|
      if req.path == '/auth/login' && req.post?
        body = JSON.parse(req.body.string) rescue {}
        body.dig("auth", "username").downcase rescue {}
      end
    end

    Rack::Attack.throttled_responder = lambda do |req|
      now = req.env['rack.attack.match_data'][:period]
      [429, { 'Content-Type' => 'application/json' }, [{ error: "Throttle limit reached. Try again in #{now} seconds." }.to_json]]
    end

    Rack::Attack.blocklisted_responder = lambda do |request|
      [ 503, {}, ['Blocked']]
    end
  end
end
