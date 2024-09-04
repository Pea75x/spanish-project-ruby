class Sentence < ApplicationRecord
  has_and_belongs_to_many :words

  validates :themes, themes: true, allow_blank: true
end