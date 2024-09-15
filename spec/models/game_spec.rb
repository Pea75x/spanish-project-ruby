require "rails_helper"

describe "#create" do
  let(:game) { Game.create(name: "Test Game")}
  let(:user) { create(:user)}

  context "#validation" do
    it "is not valid without a name" do
      expect(Game.create(themes: ["past_tense"])).to_not be_valid
    end

    it "is valid with a theme included in themes" do
      game.themes << "past_tense"
      expect(game).to be_valid
    end

    it "is not valid with a theme not included in themes" do
      game.themes << "coconut"
      expect(game).to_not be_valid
    end
  end

  context "#leaderboard" do
    let!(:game_score1) { GameScore.create(user: user, game: game, game_points: 53)}
    let!(:game_score2) { GameScore.create(user: user, game: game, game_points: 28)}
    let!(:game_score3) { GameScore.create(user: user, game: game, game_points: 19)}
    let!(:game_score4) { GameScore.create(user: user, game: game, game_points: 98)}

    it "shows only 3 scores" do
      expect(game.leaderboard.count).to eq 3
    end

    it "shows the correct order" do
      expect(game.leaderboard[0]).to include(game_points: 98)
      expect(game.leaderboard[1]).to include(game_points: 53)
      expect(game.leaderboard[2]).to include(game_points: 28)
    end

    it "shows the correct data" do
      expect(game.leaderboard[0].keys).to eq([:id, :position, :game_points, :user])
    end
  end
end
