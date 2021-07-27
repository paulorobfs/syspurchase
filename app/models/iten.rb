class Iten < ApplicationRecord
  belongs_to :merchant
  has_many :purchases, dependent: :delete_all

  validates :merchant_id, :description, :price, presence: true

end
