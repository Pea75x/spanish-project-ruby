require "rails_helper"
require 'support/auth_helper'

describe Rack::Attack, type: :request do
  include ActiveSupport::Testing::TimeHelpers
  let!(:user) { create(:user) }

  before do
    Rack::Attack.enabled = true
    Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
  end

  after do
    Rack::Attack.enabled = false
    Rack::Attack.reset!
  end

  context "throttle IP" do
    let(:request) { -> { get "/words", headers: { "Accept" => "application/json" }.merge(authenticated_header(user)) } }

    it "blocks the requests after 300 times and returns successful after the trottle period" do
      300.times do
        request.call

        expect(response).to have_http_status(:ok)
      end

      request.call

      expect(response.body).to include("Throttle limit reached. Try again in 300 seconds")
      expect(response).to have_http_status(:too_many_requests)

      travel_to(5.minutes.from_now) do
        request.call

        expect(response).to have_http_status(:ok)
      end
    end
  end

  context "throttle login email" do
    let(:request) { -> {  post "/auth/login", params: {auth: { username: "testuser123", password: "testpassword" }},
                                              headers: { "Accept" => "application/json" } } }

    it "blocks the requests after 3 times and returns successful after the trottle period" do
      3.times do
        request.call

        expect(response).to have_http_status(:ok)
      end

      request.call

      expect(response.body).to include("Throttle limit reached. Try again in 120 seconds")
      expect(response).to have_http_status(:too_many_requests)

      travel_to(5.minutes.from_now) do
        request.call

        expect(response).to have_http_status(:ok)
      end
    end
  end

  context "unknown routes" do
    context "when the request does not match any route" do
      it "blocks the request" do
        get "/word"

        expect(response.status).to eq(503)
        expect(response.body).to eq("Blocked")
      end
    end
  end
end
