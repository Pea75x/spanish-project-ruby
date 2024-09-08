FactoryBot.define do
  factory :verb, class: Word do
    word { "tener" }
    translation { "To have" }
    type_verb { true }
  end

  factory :word, class: Word do
    word { "tengo" }
    translation { "I have" }
  end
end