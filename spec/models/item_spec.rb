require 'rails_helper'

RSpec.describe Item, type: :model do
  it "valid with valid attributes" do
    item = build(:item)
    expect(item).to be_valid
  end

  it "invalid without merchant id" do
    item = build(:item, merchant: nil)
    item.valid?
    expect(item).to_not be_valid
  end

  it "invalid without description" do
    item = build(:item, description: nil)
    item.valid?
    expect(item).to_not be_valid
  end

  it "invalid without price" do
    item = build(:item, price: nil)
    item.valid?
    expect(item).to_not be_valid
  end
end
