require "rails_helper"

describe "#create" do
  let(:test_sentence) { create(:sentence) }
  let(:test_word) { create(:word) }
  let(:test_verb) { create(:verb) }

  context "#validation" do
    it "is not valid without a translation" do
      expect(Sentence.create(sentence: "test sentence")).to_not be_valid
    end

    it "is valid with a theme included in themes" do
      test_sentence.themes << "futuro"
      expect(test_sentence).to be_valid
    end

    it "is not valid with a theme not included in themes" do
      test_sentence.themes << "coconut"
      expect(test_sentence).to_not be_valid
    end
  end

  context "#words" do
    before do
      SentencesWord.create(sentence_id: test_sentence.id, word_id: test_word.id, order: 2)
      SentencesWord.create(sentence_id: test_sentence.id, word_id: test_verb.id, order: 1)
    end
    
    it "creates the link between words" do
      expect(test_sentence).to be_valid
      expect(test_sentence.words.count).to eq(2)
    end

    it "puts the words in the right order" do
      expect(test_sentence.words[0]).to eq(test_verb)
      expect(test_sentence.words[1]).to eq(test_word)
    end
  end
end