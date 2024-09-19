require "rails_helper"

describe "#create" do
  let(:test_verb) { create(:verb)}
  let(:test_word) { create(:word, verb: test_verb) }
  let(:test_sentence) { create(:sentence) }

  context "#validation" do
    it "is not valid without a translation" do
      expect(Word.create(word: "test word")).to_not be_valid
    end

    it "is valid with a theme included in themes" do
      test_word.themes << "futuro"
      expect(test_word).to be_valid
    end

    it "is not valid with a theme not included in themes" do
      test_word.themes << "coconut"
      expect(test_word).to_not be_valid
    end

    it "is invalid when attempting to add a verb to a word that is type verb" do
      test_verb.verb = test_verb
      expect(test_verb).to_not be_valid
    end

    it "is invalid when attempting to add a verb that is not of type verb" do
      test_word.verb = test_word
      expect(test_word).to_not be_valid
    end

    it "is valid when adding a verb to a word that is not type verb" do
      test_word.verb = test_verb
      expect(test_word).to be_valid
    end
  end

  context "#sentences" do
    before do
      SentencesWord.create(sentence_id: test_sentence.id, word_id: test_word.id, order: 2)
      SentencesWord.create(sentence_id: test_sentence.id, word_id: test_verb.id, order: 1)
    end
    
    it "creates the link between sentences" do
      expect(test_word).to be_valid
      expect(test_word.sentences.count).to eq(1)
    end

    it "gives back the correct sentence" do
      expect(test_word.sentences[0]).to eq(test_sentence)
      expect(test_verb.sentences[0]).to eq(test_sentence)
    end
  end
end