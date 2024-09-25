require "rails_helper"
require 'support/auth_helper'

describe WordsController, type: :request do
  let!(:user) { nil }
  let!(:tener) { create(:verb) }
  let!(:tengo) { create(:word) }
  let!(:hacer) { create(:word, word: "hacer")}
  let!(:sentence) { create(:sentence) }

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

    context "with the correct auth token" do
      let!(:user) { create(:user) }

      it "returns the all items" do
        expect(@response.parsed_body["total"]).to eq(3)
      end

      it "presents the data correctly" do
        data_attributes = @response.parsed_body["data"][0].keys

        expect(data_attributes).to eq(["id", "word", "translation", "themes"])        
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

    context "with the incorrect auth token" do
      it "returns the correct status" do
        expect(@response).to have_http_status(:unauthorized)
      end

      it "returns the correct errors" do
        expect(@response.body).to eq("Please log in")
      end
    end
  end

  describe '#show' do
    let!(:user) { create(:user) }
    let(:request) { -> { get "/words/#{tener.id}", **request_config } }

    it "presents the data correctly" do
      expect(@response.parsed_body.keys).to eq(["sentences", "verb", "id", "word", "translation", "themes", "type_verb"])
    end
  end

  describe '#create' do
    let!(:user) { create(:user) }
    let(:request) { -> { post '/words', **request_config } }

    context "with valid parameters" do
      let!(:attributes) do
        {
          word: "tenemos",
          translation: "We have",
          themes: ["presente"],
          verb_id: tener.id
        }
      end

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
          "sentences" => [],
          "themes" => ["presente"],
          "verb" => {
            "word" => "tener",
            "translation" => "To have"
          },
          "type_verb" => false
        )
      end
    end

    context "with a sentence ID" do
      let!(:attributes) do
        {
          word: "tenemos",
          translation: "We have",
          themes: ["presente"],
          sentence_ids: [sentence.id]
        }
      end

      it "returns the sentence in the data" do
        expect(@response.parsed_body["sentences"].count).to eq(1)
      end
    end
  end
end