require 'rails_helper'

RSpec.describe "Purchases", type: :request do

  describe "GET /" do
    it "purchases price present" do
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


  describe "POST /purchases" do
    context "when it has valid parameters" do
      it "create the purchases with correct attributes" do
        purchase_attributes = FactoryBot.attributes_for(:purchase)
        post purchases_path, params: {purchase: purchase_attributes}
        expect(Purchase.last).to have_attributes(purchase_attributes)
      end
    end

    context "when it has no valid parameters" do
      it "does not create purchase" do
        expect {
          post purchases_path, params: {purchase: {price: nil, user_id: nil, iten_id: nil, count: nil}}
        }.to_not change(Purchase, :count)
      end
    end

  end



end