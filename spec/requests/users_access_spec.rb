require 'rails_helper'

RSpec.describe "UsersAccess", type: :request do

  describe "GET /" do
    it "testing user access log in and logout devise" do
      user = build(:user)
      sign_in user
      get root_path
      expect(response).to have_http_status(200)
    end

    it "testing user access not logged devise" do
      get root_path
      expect(response).to have_http_status(302)
    end
  end

  describe "User dont manage" do

    let(:user) {create(:user, admin: false)}
    subject(:ability) { Ability.new(user) }
    subject {sign_in user}

    it "user not admin dont manage Merchant" do
      assert ability.cannot?(:manage, create(:merchant))
    end

    it "user not admin dont manage Purchase" do
      assert ability.cannot?(:manage, create(:purchase))
    end

    it "user not admin dont manage Iten" do
      assert ability.cannot?(:manage, create(:iten))
    end

    it "user not admin dont manage User" do
      assert ability.cannot?(:manage, create(:user))
    end
  end

  describe "User manage" do

    let(:user) {create(:user, admin: true)}
    subject(:ability) { Ability.new(user) }
    subject {sign_in user}

    it "user admin manage Merchant" do
      assert ability.can?(:manage, create(:merchant))
    end

    it "user admin manage Purchase" do
      assert ability.can?(:manage, create(:purchase))
    end

    it "user admin manage Iten" do
      assert ability.can?(:manage, create(:iten))
    end

    it "user admin manage User" do
      assert ability.can?(:manage, create(:user))
    end
  end

end