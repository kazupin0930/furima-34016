class CreateItemPurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :item_purchases do |t|
      t.integer :item_id, null: false
      t.integer :purchase_id, null: false
      t.timestamps
    end
  end
end
