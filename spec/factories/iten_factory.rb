FactoryBot.define do
  factory :iten do
    association :merchant
    description { Faker::Game.title }
    price { Random.rand(10.00..250.00).round(2) }
  end
end