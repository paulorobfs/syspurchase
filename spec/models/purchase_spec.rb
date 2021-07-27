require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it "valid with valid attributes" do
    purchase = build(:purchase)
    expect(purchase).to be_valid
  end

  it "invalid without iten id" do
    purchase = build(:purchase, iten: nil)
    purchase.valid?
    expect(purchase).to_not be_valid
  end

  it "invalid without user id" do
    purchase = build(:purchase, user: nil)
    purchase.valid?
    expect(purchase).to_not be_valid
  end

  it "invalid without count" do
    purchase = build(:purchase, count: nil)
    purchase.valid?
    expect(purchase).to_not be_valid
  end

  # it "invalid without price" do
  #   purchase = build(:purchase, price: nil)
  #   purchase.valid?
  #   expect(purchase).to_not be_valid
  # end

  it "invalid price different value iten multiply count" do
    purchase = build(:purchase)
    iten = build(:iten)
    purchase.valid?
    iten.valid?
    expect(purchase.price).to eq(purchase.count * iten.price)
  end

  it "invalid price different value iten multiply count with price change test" do
    purchase = build(:purchase, price: 20.00, count: 2)
    iten = build(:iten)
    purchase.valid?
    iten.valid?
    expect(purchase.price).to eq(purchase.count * iten.price)
  end
end
