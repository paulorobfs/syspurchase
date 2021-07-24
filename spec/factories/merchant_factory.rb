FactoryBot.define do
  factory :merchant do
    name { "Market Plus Games" }
    address { "St Locky Street 30" }
    #initialize_with { User.find_or_create_by(username: username) }
  end
end