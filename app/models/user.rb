class User < ApplicationRecord
  has_secure_password

  include Emailable

  validates :username, words: true, allow_blank: true, uniqueness: true

  has_many :game_scores, dependent: :destroy

  def total_score
    game_scores.map(&:game_points).inject(0, :+)
  end
end