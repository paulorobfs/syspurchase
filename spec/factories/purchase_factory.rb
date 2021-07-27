FactoryBot.define do
  factory :purchase do
    association :user
    association :iten
    price { 100.00 }
    count { 10 }
  end
end