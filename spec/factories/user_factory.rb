FactoryBot.define do
  factory :user do
    name { "John Doe" }
    password { "123456" }
    email {"john@teste.com"}
    #initialize_with { User.find_or_create_by(username: username) }
  end
end