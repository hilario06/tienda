class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :code
      t.string :stock, default: 0
      t.string :price, default: 0
      t.string :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
