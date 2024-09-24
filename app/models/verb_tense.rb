class VerbTense < ApplicationRecord
  belongs_to :verb, class_name: "Word", optional: true
  belongs_to :yo, class_name: 'Word', optional: true
  belongs_to :tu, class_name: 'Word', optional: true
  belongs_to :el, class_name: 'Word', optional: true
  belongs_to :nosotros, class_name: 'Word', optional: true
  belongs_to :ellos, class_name: 'Word', optional: true
end