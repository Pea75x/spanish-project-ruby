class Game < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :themes, themes: true, allow_blank: true

  has_many :game_scores, dependent: :destroy
end