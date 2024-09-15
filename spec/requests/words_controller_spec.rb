require "rails_helper"
require 'support/auth_helper'

describe WordsController, type: :request do
  let!(:user) { create(:user) }
  let!(:tener) { create(:verb) }
  let!(:tengo) { create(:word) }
  let!(:hacer) { create(:word, word: "hacer")}

  let(:attributes) { {} }
  let(:params) do
    { 
      word: attributes 
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
    let(:request) { -> { get '/words', **request_config } }

    it "returns the all items" do
      expect(@response.parsed_body["total"]).to eq(3)
    end

    it "presents the data correctly" do
      data_attributes = @response.parsed_body["data"][0].keys

      expect(data_attributes).to eq(["id", "word", "translation"])
      
      expect(data_attributes).to_not include(["sentences", "themes", "created_at", "updated_at"])
    end

    context "using the word search" do
      let(:params) do
        { 
          words: "ten"
        }
      end
  
      it "returns the correct items" do
        expect(@response.parsed_body["total"]).to eq(2)
      end
    end
  end

  describe '#show' do
    let(:request) { -> { get "/words/#{tener.id}", **request_config } }

    it "presents the data correctly" do
      expect(@response.parsed_body.keys).to eq(["sentences", "verb", "id", "word", "translation", "themes"])
    end
  end

  describe '#create' do
    let(:attributes) do
      {
        word: "tenemos",
        translation: "We have",
        themes: ["present_tense"],
        verb_id: tener.id
      }
    end
    let(:request) { -> { post '/words', **request_config } }

    context "with valid parameters" do
      it "creates the word" do
        expect(@response).to have_http_status(:created)
      end

      it "adds the word onto the verb" do
        expect(tener.words.count).to eq(1)
      end

      it "returns the correct data" do
        expect(@response.parsed_body).to include(
          "id" => be_present,
          "word" => "tenemos",
          "translation" => "We have",
          "themes" => ["present_tense"],
          "verb" => {
            "word" => "tener",
            "translation" => "To have"
          }
        )
      end
    end
  end
end