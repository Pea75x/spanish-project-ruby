class GameScore < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates :game_points, presence: true 
end