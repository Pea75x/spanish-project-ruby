FactoryBot.define do
  factory :sentence, class: Sentence do
    sentence { "Tengo hambre" }
    translation { "I am hungry" }
  end
end