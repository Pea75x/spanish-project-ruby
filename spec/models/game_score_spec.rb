require "rails_helper"

describe "#create" do
  let(:game) { Game.create(name: "Test Game")}
  let(:user) { create(:user)}
  let!(:game_score1) { GameScore.create(user: user, game: game, game_points: 53)}

  context "#game_name" do
    it "returns the name of the game" do
      expect(game_score1.game_name).to eq("Test Game")
    end
  end

  context "#leaderboard_ranking" do
    let!(:game_score2) { GameScore.create(user: user, game: game, game_points: 28)}
    let!(:game_score3) { GameScore.create(user: user, game: game, game_points: 19)}
    let!(:game_score4) { GameScore.create(user: user, game: game, game_points: 98)}

    it "returns the correct ranking if you finish in the top 3" do
      expect(game_score4.leaderboard_ranking).to eq(1)
    end

    it "returns nil if you do not finish in the top 3" do
      expect(game_score3.leaderboard_ranking).to eq(nil)
    end
  end
end
