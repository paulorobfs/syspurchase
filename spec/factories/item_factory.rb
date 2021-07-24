FactoryBot.define do
  factory :item do
    association :merchant
    description { "Produto 1" }
    price { 10.00 }
  end
end