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

end