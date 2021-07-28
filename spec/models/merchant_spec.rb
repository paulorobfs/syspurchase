require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it "valid with valid attributes" do
    merchant = build(:merchant)
    expect(merchant).to be_valid
  end

  it "invalid without name" do
    merchant = build(:merchant, name: nil)
    merchant.valid?
    expect(merchant).to_not be_valid
  end

  it "invalid without address" do
    merchant = build(:merchant, address: nil)
    merchant.valid?
    expect(merchant).to_not be_valid
  end

  context "testing complete crud" do
    before(:all) do
      @current_date = DateTime.now
      @merchant = Merchant.create(name: "Games Forever", address: "Future Street", created_at: @current_date)
    end

    it 'checks that a merchant can be created' do
      expect(@merchant).to be_valid
    end

    it 'checks that a merchant can be read' do
      expect(Merchant.where(name: "Games Forever", created_at: @current_date).first).to eq(@merchant)
    end

    it 'checks that a merchant can be updated' do
      @merchant.update(name: "Games Forever Ultimate")
      expect(Merchant.where(name: "Games Forever Ultimate").first).to eq(@merchant)
    end

    it 'checks that a merchant can be destroyed' do
      @merchant.destroy
      expect(Merchant.count).to be > 0
    end

    it 'checks that a merchant can be destroyed' do
      @merchant.destroy
      expect(Merchant.where(name: "Games Forever Ultimate").first).to be_nil
    end
  end

end
