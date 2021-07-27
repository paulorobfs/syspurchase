class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :iten

  validates :user_id, :count, :iten_id, presence: true
  before_save :validate_price
  before_save :set_price

  def validate_price
    unless self.price.eql? self.count * self.iten.price
      errors.add(:price, 'the result of multiplying the quantity with the item price is different')
    end
  end

  def set_price
    self.price = self.count * self.iten.price
  end


end
