FactoryBot.define do
  factory :user do
    name { "Example User" }
    email { "user@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }

    trait :blank_name do
      name { "   " }
    end

    trait :blank_email do
      email { "   " }
    end

    trait :too_long_name do
      name { "a" * 51 }
    end

    trait :too_long_email do
      email { "a" * 244 + "@example.com" }
    end

    trait :blank_password do
      password { " " * 6 }
      password_confirmation { " " * 6 }
    end

    trait :too_short_password do
      password { "a" * 5 }
      password_confirmation { "a" * 5 }
    end
  end
end
