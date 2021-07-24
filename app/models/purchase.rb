class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :user_id, :count, :item_id, :price, presence: true
  before_save :validate_price



  def validate_price
    unless self.price.eql? self.count * self.item.price
      errors.add(:price, 'the result of multiplying the quantity with the item price is different')
    end
  end


end
