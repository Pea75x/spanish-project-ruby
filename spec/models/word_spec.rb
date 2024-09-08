require "rails_helper"

describe "#create" do
  let(:test_verb) { create(:verb)}
  let(:test_word) { create(:word, verb: test_verb) }

  context "#validation" do
    it "is not valid without a translation" do
      expect(Word.create(word: "test word")).to_not be_valid
    end

    it "is valid with a theme included in themes" do
      test_word.themes << "past_tense"
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
end