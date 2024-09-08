require "rails_helper"

describe "#create" do
  let(:test_sentence) { create(:sentence)}

  context "#validation" do
    it "is not valid without a translation" do
      expect(Sentence.create(sentence: "test sentence")).to_not be_valid
    end

    it "is valid with a theme included in themes" do
      test_sentence.themes << "past_tense"
      expect(test_sentence).to be_valid
    end

    it "is not valid with a theme not included in themes" do
      test_sentence.themes << "coconut"
      expect(test_sentence).to_not be_valid
    end
  end
end