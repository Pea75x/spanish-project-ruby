class Word < ApplicationRecord
  validates :word, words: true, uniqueness: true
  validates :translation, presence: true, length: { maximum: 50 }
  validates :themes, themes: true, allow_blank: true
  validate :verb_id_validation

  has_many :sentences_words
  has_many :sentences, through: :sentences_words
end