class SentencesWord < ApplicationRecord
  belongs_to :sentence
  belongs_to :word, dependent: :destroy

  default_scope { order(:order) }
end