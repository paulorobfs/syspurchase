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