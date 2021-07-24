FactoryBot.define do
  factory :user do
    name { "John Doe" }
    password { "123456" }
    email {"john@teste.com"}
  end
end