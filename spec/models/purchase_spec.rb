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
    before(:all) do
      @current_date = DateTime.now
      @purchase = Purchase.create(user: User.create(name:"Jhon Doe", email: "jhondoe@gmail.com", password: "123456"),
                                  iten: Iten.create(description: "Red Dead Rendenption", price: 100.00, 
                                                    merchant: @merchant = Merchant.create(name: "Games Forever", address: "Future Street")), 
                                  price: 200.00, count: 2, created_at: @current_date)
    end

    it 'checks that a purchase can be created' do
      expect(@purchase).to be_valid
    end

    it 'checks that a purchase can be read' do
      expect(Purchase.where(user: @user, iten: @iten, price: 200.00, created_at: @current_date).first).to eq(@purchase)
    end

    it 'checks that a purchase can be updated' do
      @purchase.update(count: 3, price: "300.00")
      expect(purchase.where(id: @purchase.id, count: 3, price: 300.00).first).to eq(@purchase)
    end

    it 'checks that a purchase can be destroyed' do
      @purchase.destroy
      expect(Purchase.count).to > 0
    end

    it 'checks that a purchase can be destroyed' do
      @purchase.destroy
      expect(purchase.where(count: 3, price: "300.00", created_at: @current_date ).first).to be_nil
    end
  end
end
