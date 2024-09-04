class Verb < ApplicationRecord
  validates :verb, presence: true, length: { maximum: 50 }
  validates :translation, presence: true, length: { maximum: 50 }

  has_many :words, dependent: :nullify
end