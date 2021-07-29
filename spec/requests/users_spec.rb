require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /" do
    it "users name present" do
      user = build(:user, admin: true)
      sign_in user

      users = create_list(:user, 3)
      get users_path
      users.each do |user|
        expect(response.body).to include(user.name)
      end

      sign_out user
    end
  end


  describe "POST /users" do
    context "when it has valid parameters" do
      it "create the users with correct attributes" do
        qtd = User.count
        user_attributes = FactoryBot.attributes_for(:user)
        post users_path, params: {user: user_attributes}
        expect(User.count).to be > qtd
      end
    end

    context "when it has no valid parameters" do
      it "does not create user" do
        expect {
          post users_path, params: {user: {name: nil, email: nil}}
        }.to_not change(User, :count)
      end
    end

  end

end