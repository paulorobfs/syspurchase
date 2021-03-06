class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :iten, null: false, foreign_key: true
      t.numeric :price
      t.integer :count

      t.timestamps
    end
  end
end
