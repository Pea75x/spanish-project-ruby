class Game < ApplicationRecord
  has_many :game_scores, dependent: :destroy
end