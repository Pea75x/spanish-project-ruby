require 'rails_helper'
require 'support/auth_helper'

describe UsersController, type: :request do
  let(:user) { nil }
  let(:attributes) do
    {
      email: "email@email.com",
      username: "user123",
      password: "password123"
    }
  end

  let(:params) do
    { 
      user: attributes
    }
  end

  let(:request_config) do
    {
      params: params,
      headers: { "Accept" => "application/json" }.merge(authenticated_header(user))
    }
  end

  before do
    request.call
  end

  describe "#create" do
    let(:request) { -> { post '/users', **request_config } }

    context "with the correct auth token" do
      let!(:user) { create(:user) }

      context "with valid attributes" do
        it "creates the user" do
          expect(@response).to have_http_status(:created)
        end

        it "returns the token" do
          expect(@response.parsed_body.keys).to eq(["token"])
        end
      end

      context "with invalid attributes" do
        let(:attributes) do
          {
            email: "email",
            password: "password123"
          }
        end

        it "returns the correct status" do
          expect(@response).to have_http_status(:bad_request)
        end

        it "returns the correct errors" do
          expect(@response.parsed_body["message"]).to eq({
            "email" => ["is invalid"],
            "username" => ["Can't be blank"]
            })
        end
      end
    end

    context "with the incorrect auth token" do
      it "returns the correct status" do
        expect(@response).to have_http_status(:unauthorized)
      end

      it "returns the correct errors" do
        expect(@response.parsed_body["message"]).to eq("Please log in")
      end
    end
  end

  describe "#show" do
    let(:user) { create(:user) }
    let(:request) { -> { get "/users/#{user.id}", **request_config } }

    it "presents the data correctly" do
      expect(@response.parsed_body.keys).to eq(["game_scores", "id", "username", "total_score"])
    end
  end
end