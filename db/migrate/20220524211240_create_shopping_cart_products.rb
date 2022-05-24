class CreateShoppingCartProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_cart_products do |t|
      t.integer :quantity, default: 1
      t.references :shopping_cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
