
require "rails_helper"

describe WordsController, type: :request do
  let!(:tienes) { create(:word, word: "tienes", translation: "You have") }
  let!(:sentence1) { create(:sentence, sentence: "Como te sientes hoy?")}
  let!(:sentence2) { create(:sentence, sentence: "Quieres comer algo?")}
  
  let(:attributes) { {} }
  let(:params) do
    { 
      sentence: attributes 
    }
  end

  let(:request_config) do
    {
      params: params,
      headers: { "Accept" => "application/json" }
    }
  end

  before do
    request.call
  end

  describe '#index' do
    let(:request) { -> { get '/sentences', **request_config } }

    it "returns the all items" do
      expect(@response.parsed_body["total"]).to eq(2)
    end

    it "presents the data correctly" do
      data_attributes = @response.parsed_body["data"][0].keys

      expect(data_attributes).to eq(["words", "id", "sentence", "translation", "themes",])
      
      expect(data_attributes).to_not include(["created_at", "updated_at"])
    end

    context "using the search" do
      let(:params) do
        { 
          sentences: "como"
        }
      end
  
      it "returns the correct items" do
        expect(@response.parsed_body["total"]).to eq(1)
      end
    end
  end

  describe '#show' do
    let(:request) { -> { get "/sentences/#{sentence1.id}", **request_config } }

    it "presents the data correctly" do
      expect(@response.parsed_body.keys).to eq(["words", "id", "sentence", "translation", "themes"])
    end
  end

  describe '#create' do
    let(:attributes) do
      {
        sentence: "Tienes razon",
        translation: "You're right",
        themes: ["present_tense"],
        word_ids: [ tienes.id ]
      }
    end
    let(:request) { -> { post '/sentences', **request_config } }

    context "with valid parameters" do
      it "creates the word" do
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
          "themes" => ["present_tense"],
          "words" => [{
            "id" => be_present,
            "translation" => "You have",
            "word" => "tienes"
          }]
        )
      end
    end
  end
end