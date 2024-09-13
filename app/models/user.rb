class User < ApplicationRecord
  has_secure_password

  has_many :game_scores, dependent: :destroy

end