
require "rails_helper"
require 'support/auth_helper'

describe SentencesController, type: :request do
  let!(:tienes) { create(:word, word: "tienes", translation: "You have") }
  let!(:hiciste) { create(:word, word: "hiciste") }
  let!(:que) { create(:word, word: "que") }
  let!(:sentence1) { create(:sentence, sentence: "Como te sientes hoy?", themes: ["presente", "you"]) }
  let!(:sentence2) { create(:sentence, sentence: "Quieres comer algo?", themes:["presente", "food"]) }
  let!(:sentence3) { create(:sentence, sentence: "Que Hiciste", themes: ["preterito_indefinido", "activities"]) }
  let!(:relationship1) { SentencesWord.create(sentence_id: sentence1.id, word_id: que.id, order: 1)}
  let!(:relationship2) { SentencesWord.create(sentence_id: sentence1.id, word_id: hiciste.id, order: 2) }

  let!(:user) { nil }
  let(:attributes) { {} }
  let(:params) do
    { 
      sentence: attributes 
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
    let(:request) { -> { get '/sentences', **request_config } }

    context "with the correct auth token" do
      let!(:user) { create(:user) }

      it "returns the all items" do
        expect(@response.parsed_body["total"]).to eq(3)
      end

      it "presents the data correctly" do
        data_attributes = @response.parsed_body["data"][0].keys
        expect(data_attributes).to eq(["id", "sentence", "translation", "themes", "words"])
        
        expect(data_attributes).to_not include(["created_at", "updated_at"])
      end

      it "attaches the words correctly" do
        words = @response.parsed_body["data"][0]["words"]

        expect(words.count).to eq(2)
        expect(words.first["word"]).to eq("que")
        expect(words.second["word"]).to eq("hiciste")
      end

      context "using the sentence search" do
        let(:params) do
          { 
            sentences: "como"
          }
        end
    
        it "returns the correct items" do
          expect(@response.parsed_body["total"]).to eq(1)
        end
      end

      context "using the themes search" do
        context "with 1 theme" do
          let(:params) do
            { 
              themes: ["presente"]
            }
          end
      
          it "returns the correct items" do
            expect(@response.parsed_body["total"]).to eq(2)
          end
        end

        context "with multiple themes" do
          let(:params) do
            {
              themes: ["preterito_indefinido", "activities"]
            }
          end

          it "returns the correct items" do
            expect(@response.parsed_body["total"]).to eq(1)
          end
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
    let(:request) { -> { get "/sentences/#{sentence1.id}", **request_config } }

    it "presents the data correctly" do
      expect(@response.parsed_body.keys).to eq(["id", "sentence", "translation", "themes", "words"])
    end
  end

  describe '#create' do
    let!(:user) { create(:user) }

    let(:attributes) do
      {
        sentence: "Tienes razon",
        translation: "You're right",
        themes: ["presente"],
        word_ids: [ tienes.id ]
      }
    end
    let(:request) { -> { post '/sentences', **request_config } }

    context "with valid parameters" do
      it "creates the sentence" do
        expect(@response).to have_http_status(:created)
      end

      it "adds the sentence onto the word" do
        expect(tienes.sentences.count).to eq(1)
      end

      it "returns the correct data" do
        expect(@response.parsed_body).to include(
          "id" => be_present,
          "sentence" => "Tienes razon",
          "translation" => "You're right",
          "themes" => ["presente"],
          "words" => [{
            "id" => be_present,
            "translation" => "You have",
            "themes" => [],
            "word" => "tienes"
          }]
        )
      end
    end
  end
end