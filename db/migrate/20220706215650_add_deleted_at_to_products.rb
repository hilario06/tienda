class AddDeletedAtToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :deleted_at, :datetime
    add_index :products, :deleted_at
  end
end
