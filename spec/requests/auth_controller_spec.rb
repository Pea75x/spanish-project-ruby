require 'rails_helper'

describe AuthController, type: :request do
  let!(:user) { create(:user) }

  let(:attributes) do
    {
      username: "testuser123",
      password: "wrong password"
    }
  end

  let(:params) do
    { 
      auth: attributes 
    }
  end

  let(:request_config) do
    {
      params: params,
      headers: { "Accept" => "application/json" }
    }
  end

  describe "#login" do  
    let(:request) { -> { post '/auth/login', **request_config } }

    context "with the correct params" do
      let!(:attributes) do
        {
          username: "testuser123",
          password: "testpassword"
        }
      end

      before do
        request.call
      end

      it "returns the correct status" do
        expect(@response).to have_http_status(:ok)
      end

      it "returns the token and user" do
        expect(@response.parsed_body.keys).to eq(["token", "user"])
      end
    end

    context "with incorrect params" do
      before do
        request.call
      end

      it "returns the correct status" do
        expect(@response).to have_http_status(:unauthorized)
      end

      it "returns the token" do
        expect(@response.body).to eq("Bad credentials")
      end
    end
  end
end
