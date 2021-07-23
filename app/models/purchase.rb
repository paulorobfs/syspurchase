class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :user_id, :count, :item_id, presence: true
end
