class CreateItens < ActiveRecord::Migration[6.0]
  def change
    create_table :itens do |t|
      t.references :merchant, null: false, foreign_key: true
      t.string :description
      t.numeric :price

      t.timestamps
    end
  end
end
