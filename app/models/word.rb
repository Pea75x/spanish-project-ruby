class Word < ApplicationRecord
  validates :word, words: true, uniqueness: true, presence: true
  validates :translation, presence: true, length: { maximum: 50 }
  validates :themes, themes: true, allow_blank: true
  validate :verb_id_validation

  belongs_to :verb, class_name: 'Word', optional: true
  has_many :words, class_name: 'Word', foreign_key: 'verb_id', dependent: :nullify
  has_many :sentences_words
  has_many :sentences, through: :sentences_words

  def verb_id_validation
    return if verb_id.nil?

    verb = Word.find(verb_id)

    errors.add(:verb_id, "can't be added to type verb") if type_verb && verb_id
    errors.add(:verb_id, "word is not of type verb") if verb.type_verb == false
  end
end