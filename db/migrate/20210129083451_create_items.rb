class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text       :name, null: false
      t.text       :description, null: false
      t.integer    :category_id, null: false
      t.integer    :condition_id, null: false
      t.integer    :shipping_charges_id, null: false
      t.integer    :shipping_area_id, null: false
      t.integer    :day_to_ship_id, null: false
      t.integer    :price, null: false
      t.string     :who_bought_it, null: false
      t.timestamps
    end
  end
end