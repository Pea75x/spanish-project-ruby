require "rails_helper"

describe "#create" do
  let!(:verb) { create(:verb)}
  let(:subject) { create(:word, verb: verb) }

  context "When creating a new word" do
    it "is not valid without a translation" do
      expect(Word.create(word: "test word")).to_not be_valid
    end

     it "is valid with a theme included in themes" do
      subject.themes << "past_tense"
      expect(subject).to be_valid
    end

    it "is not valid with a theme not included in themes" do
      subject.themes << "coconut"
      expect(subject).to_not be_valid
    end
  end
end