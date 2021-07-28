FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    password { "password" }
    password_confirmation { "password" }
    email {Faker::Internet.email}
  end
end