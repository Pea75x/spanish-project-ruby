class GameScore < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates :game_points, presence: true
  validates :game_id, presence: true
  validates :user_id, presence: true

  def game_name
    game.name
  end

  def leaderboard_ranking
    leaderboard_place = game.leaderboard.find do |ranking, position|
      ranking[:id] === id
    end

    leaderboard_place[:position] if leaderboard_place.present?
  end
end
