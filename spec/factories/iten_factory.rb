FactoryBot.define do
  factory :iten do
    association :merchant
    description { "Produto 1" }
    price { 10.00 }
  end
end