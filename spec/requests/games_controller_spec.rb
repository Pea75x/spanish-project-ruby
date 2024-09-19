require 'rails_helper'
require 'support/auth_helper'

describe GamesController, type: :request do
  let!(:game1) { Game.create(name: "game1") }
  let!(:game2) { Game.create(name: "game2") }
  let!(:user) { create(:user) }
  let!(:score) { GameScore.create(user: user, game: game1, game_points: 56) }

  let(:attributes) { {} }

  let(:params) do
    { 
      game: attributes 
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

  describe '#index' do
    let(:request) { -> { get '/games', **request_config } }

    it "returns the all items" do
      expect(@response.parsed_body["total"]).to eq(2)
    end

    it "presents the data correctly" do
      data_attributes = @response.parsed_body["data"][0].keys

      expect(data_attributes).to eq(["id", "name", "themes"])
    end
  end

  describe '#show' do

    context "with correct game ID" do
      let(:request) { -> { get "/games/#{game1.id}", **request_config } }

      it "presents the data correctly" do
        expect(@response.parsed_body).to match({
          "id" => be_present,
          "name" => game1.name,
          "themes" => [],
          "leaderboard" => [{
            "game_points" => score[:game_points],
            "user" => user.username,
            "id" => score[:id],
            "position" => be_present
            }]
        })
      end
    end

    context "with incorrect game ID" do
      let(:request) { -> { get "/games/23", **request_config } }

      it "presents the correct error" do
        expect(@response).to have_http_status(:not_found)

        expect(@response.body).to eq("Record Not Found")
      end
    end
  end

  describe '#create' do
    context "with valid parameters" do
      let(:attributes) do
        {
          name: "game name",
          themes: ["presente"],
        }
      end
      let(:request) { -> { post "/games", **request_config } }

      it "creates the game" do
        expect(@response).to have_http_status(:created)
      end
    end
  end
end
