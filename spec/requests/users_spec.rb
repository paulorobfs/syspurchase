require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /" do
    it "users name present" do
      user = build(:user, admin: true)
      sign_in user

      users = create_list(:user, 3)
      users.each do |user|
        expect(response.body).to include(user.name)
      end

      sign_out user
    end
  end


  # describe "POST /users" do
  #   context "when it has valid parameters" do
  #     it "create the users with correct attributes"
  #   end
  #
  #   context "when it has no valid parameters" do
  #     it "does not create user"
  #   end
  #
  # end



end