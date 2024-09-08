FactoryBot.define do
  factory :verb, class: Verb do
    verb { "test verb" }
    translation { "test translation" }
  end
end