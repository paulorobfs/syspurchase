FactoryBot.define do
  factory :purchase do
    association :user
    association :iten
    price { Random.rand(10.00..250.00).round(2) }
    count { Random.rand(1..10) }
  end
end