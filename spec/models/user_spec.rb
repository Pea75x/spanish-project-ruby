require "rails_helper"

describe "#create" do
  let(:test_user) { create(:user)}

  context "#validation" do
    it "is valid with correct username" do
      expect(test_user).to be_valid
    end

    it "is invalid without correct username" do
      test_user.username = "$invalid username"
      expect(test_user).to_not be_valid
    end

    it "is valid with correct email" do
      expect(test_user).to be_valid
    end

    it "is invalid with incorrect email" do
      test_user.email = "email"
      expect(test_user).to_not be_valid
    end
  end

  context "#total score" do
    context "with no games played" do
      it "should return 0" do
        expect(test_user.total_score).to eq(0)
      end
    end

    context "with multiple games played" do
      let!(:game) { Game.create(name: "test_game") }
      let!(:game_score1) { GameScore.create(user: test_user, game: game, game_points: 28)}
      let!(:game_score2) { GameScore.create(user: test_user, game: game, game_points: 19)}
      let!(:game_score3) { GameScore.create(user: test_user, game: game, game_points: 98)}

      it "should return the correct score" do
        expect(test_user.total_score).to eq(145)
      end
    end
  end
end