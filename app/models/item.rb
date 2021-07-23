class Item < ApplicationRecord
  belongs_to :merchant
  has_many :purchases

  validates :merchant_id, :description, :price, presence: true

end
