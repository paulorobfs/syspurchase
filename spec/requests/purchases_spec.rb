require 'rails_helper'

RSpec.describe "Purchases", type: :request do

  describe "GET /" do
    it "purchases description present" do
      user = build(:user, admin: true)
      sign_in user

      purchases = create_list(:purchase, 3)
      get purchases_path
      purchases.each do |purchases|
        expect(response.body).to include(purchases.iten.description)
      end

      sign_out user
    end
  end

end