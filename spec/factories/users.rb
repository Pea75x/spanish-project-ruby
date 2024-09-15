FactoryBot.define do
  factory :user, class: User do
    username { "testuser123" }
    email { "test@email.com" }
    password { "testpassword" }

    factory :admin_user, class: User do
      admin { true }
    end
  end
end
