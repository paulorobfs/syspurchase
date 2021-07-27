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
end
