class CreateCharges < ActiveRecord::Migration[6.1]
  def change
    create_table :charges do |t|
      t.string :uid, limit: 50
      t.integer :status, default: 0
      t.integer :payment_method, default: 0
      t.decimal :amount, default: 0
      t.text :error_message
      t.jsonb :response_data
      t.references :user, null: false, foreign_key: true
      t.references :shopping_cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
