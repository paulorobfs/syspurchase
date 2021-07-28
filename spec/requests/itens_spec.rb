require 'rails_helper'

RSpec.describe "Itens", type: :request do

  describe "GET /" do
    it "itens description present" do
      user = build(:user, admin: true)
      sign_in user

      itens = create_list(:iten, 3)
      get itens_path
      itens.each do |itens|
        expect(response.body).to include(itens.description)
      end

      sign_out user
    end
  end


  describe "POST /itens" do
    context "when it has valid parameters" do
      it "create the itens with correct attributes" do
        iten_attributes = FactoryBot.attributes_for(:iten)
        post itens_path, params: {iten: iten_attributes}
        expect(Iten.last).to have_attributes(iten_attributes)
      end
    end

    context "when it has no valid parameters" do
      it "does not create iten" do
        expect {
          post itens_path, params: {iten: {description: nil, price: nil}}
        }.to_not change(Iten, :count)
      end
    end

  end



end