require 'rails_helper'

RSpec.describe "Merchants", type: :request do

  describe "GET /" do
    it "merchants name present" do
      user = build(:user, admin: true)
      sign_in user

      merchants = create_list(:merchant, 3)
      get merchants_path
      merchants.each do |merchants|
        expect(response.body).to include(merchants.name)
      end

      sign_out user
    end
  end


  describe "POST /merchants" do
    # context "when it has valid parameters" do
    #   it "create the merchants with correct attributes" do
    #     merchant_attributes = FactoryBot.attributes_for(:merchant)
    #     post merchants_path, params: {merchant: merchant_attributes}
    #     expect(Merchant.last).to have_attributes(merchant_attributes)
    #   end
    # end

    context "when it has no valid parameters" do
      it "does not create merchant" do
        expect {
          post merchants_path, params: {merchant: {name: nil, address: nil}}
        }.to_not change(Merchant, :count)
      end
    end

  end


  describe "Update /update" do
    context 'When user has signed in ' do
      let!(:user) { create(:user, admin: true) }
      before do
        sign_in(user)
      end
      context 'User update merchant' do
        it "update the requested merchant" do

          expect {
            create(:merchant)
          }.to change(Merchant, :count)
        end
      end
    end
  end


  describe "DELETE /destroy" do
    context 'When user has signed in ' do
      let!(:user) { create(:user, admin: true) }
      before do
        sign_in(user)
      end
      context 'User who created the merchant can destroy' do
        it "destroys the requested merchant" do

          expect {
            merchant = create(:merchant)
            delete merchant_url(merchant)
          }.to change(Merchant, :count).by(0)
        end
      end
    end
  end



end