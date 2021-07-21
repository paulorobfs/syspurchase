require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET /itens" do
    it "works! (now write some real specs)" do
      get itens_path
      expect(response).to have_http_status(200)
    end
  end
end
