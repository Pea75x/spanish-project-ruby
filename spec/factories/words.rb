FactoryBot.define do
  factory :word, class: Word do
    word { "test word" }
    translation { "test translation" }
  end
end