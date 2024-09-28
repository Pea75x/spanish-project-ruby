require "rails_helper"

describe Rack::Attack, type: :request do
  include ActiveSupport::Testing::TimeHelpers

   before do
    # Enable Rack::Attack for this test
    Rack::Attack.enabled = true
    Rack::Attack.reset!
  end

end
