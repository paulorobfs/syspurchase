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

  it "invalid price different value iten multiply count" do
    purchase = build(:purchase, price: 20.00, count: 2)
    iten = build(:iten, price: 10.00)
    purchase.valid?
    iten.valid?
    expect(purchase.price).to eq(purchase.count * iten.price)
  end

  it "invalid price different value iten multiply count with price change test" do
    purchase = build(:purchase, price: 20.00, count: 2)
    iten = build(:iten, price: 50.00)
    purchase.valid?
    iten.valid?
    expect(purchase.price).not_to eq(purchase.count * iten.price)
  end

  context "testing complete crud" do
    let(:merchant) {create(:merchant)}
    let(:user) {create(:user)}
    let(:iten) {create(:iten, description: "Red Dead Rendenption", merchant: merchant)}
    subject(:purchase) {create(:purchase, user: user, iten: iten, price: 200.00, count: 2)}

    it 'checks that a purchase can be created' do
      expect(purchase).to be_valid
    end

    it 'checks that a purchase can be read' do
      expect(Purchase.where(user: @user, iten: @iten, price: 200.00, created_at: @current_date).first).to eq(@purchase)
    end

    it 'checks that a purchase can be updated' do
      purchase.update(count: 3, price: "300.00")
      expect(Purchase.where(id: purchase.id, count: 3, price: 300.00).first).to eq(@purchase)
    end

  end
end
