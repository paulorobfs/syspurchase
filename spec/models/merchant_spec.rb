require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it "valid with valid attributes" do
    merchant = build(:merchant)
    expect(merchant).to be_valid
  end

  it "invalid without name" do
    merchant = build(:merchant, name: nil)
    merchant.valid?
    #expect(merchant.errors[:name]).to include("can't be blank")
    expect(merchant).to_not be_valid
  end

  it "invalid without address" do
    merchant = build(:merchant, address: nil)
    merchant.valid?
    #expect(merchant.errors[:email]).to include("can't be blank")
    expect(merchant).to_not be_valid
  end

end
