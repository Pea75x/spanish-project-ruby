class Game < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :themes, themes: true, allow_blank: true

  has_many :game_scores, dependent: :destroy

  def leaderboard
    positions = game_scores.order(game_points: "desc").limit(3)

    positions.each_with_index.map do |score, position|
      { id: score.id, position: position + 1, game_points: score.game_points, user: score.user.username }
    end
  end
end
