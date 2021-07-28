require 'rails_helper'

RSpec.describe Iten, type: :model do
  it "valid with valid attributes" do
    iten = build(:iten)
    expect(iten).to be_valid
  end

  it "invalid without merchant id" do
    iten = build(:iten, merchant: nil)
    iten.valid?
    expect(iten).to_not be_valid
  end

  it "invalid without description" do
    iten = build(:iten, description: nil)
    iten.valid?
    expect(iten).to_not be_valid
  end

  it "invalid without price" do
    iten = build(:iten, price: nil)
    iten.valid?
    expect(iten).to_not be_valid
  end

  context "testing complete crud" do
    before(:all) do
      @merchant = Merchant.create(name: "Games Forever", address: "Future Street")
      @current_date = DateTime.now
      @iten = Iten.create(description: "Red Dead Rendenption", price: 100.00, merchant: @merchant, created_at: @current_date)
    end

    it 'checks that a iten can be created' do
      expect(@iten).to be_valid
    end

    it 'checks that a iten can be read' do
      expect(Iten.where(description: "Red Dead Rendenption", created_at: @current_date).first).to eq(@iten)
    end

    it 'checks that a iten can be updated' do
      @iten.update(description: "Red Dead Rendenption 2 - Ultimate")
      expect(Iten.where(description: "Red Dead Rendenption 2 - Ultimate").first).to eq(@iten)
    end

    it 'checks that a iten can be destroyed' do
      @iten.destroy
      expect(Iten.count).to be > 0
    end

    it 'checks that a iten can be destroyed' do
      @iten.destroy
      expect(Iten.where(description: "Red Dead Rendenption 2 - Ultimate").first).to be_nil
    end
  end

end
