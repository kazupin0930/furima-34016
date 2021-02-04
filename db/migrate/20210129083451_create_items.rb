class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name, null: false
      t.text       :description, null: false
      t.integer    :category_id, null: false
      t.integer    :condition_id, null: false
      t.integer    :shipping_charge_id, null: false
      t.integer    :shipping_area_id, null: false
      t.integer    :day_to_ship_id, null: false
      t.integer    :price, null: false
      t.references :user, foreign_key: true
      t.integer    :seller_id, null: false
      t.integer    :buyer_id, null: false
      t.timestamps
    end
  end
end