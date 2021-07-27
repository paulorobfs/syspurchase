class Merchant < ApplicationRecord
  has_many :itens

  validates :name, :address, presence: true
end
