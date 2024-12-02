class Sentence < ApplicationRecord
  validates :sentence, uniqueness: true
  validates :translation, presence: true, length: { maximum: 100 }
  validates :themes, themes: true, allow_blank: true

  has_many :sentences_words
  has_many :words, through: :sentences_words
end