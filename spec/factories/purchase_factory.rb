FactoryBot.define do
  factory :purchase do
    association :user
    association :item
    price { 100.00 }
    count { 10 }
  end
end