class Word < ApplicationRecord
  validates :word, presence: true, length: { maximum: 50 }
  validates :translation, presence: true, length: { maximum: 50 }

  belongs_to :verb
  has_and_belongs_to_many :sentences
end