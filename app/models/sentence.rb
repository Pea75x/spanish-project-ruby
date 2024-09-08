class Sentence < ApplicationRecord
  validates :translation, presence: true, length: { maximum: 50 }
  validates :themes, themes: true, allow_blank: true

  has_and_belongs_to_many :words
end