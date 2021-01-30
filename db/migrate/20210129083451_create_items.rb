class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text     :name, null: false
      t.text     :description, null: false
      t.string   :category, null: false
      t.string   :condition, null: false
      t.string   :shipping_charges, null: false
      t.string   :shipping_area, null: false
      t.string   :day_to_ship, null: false
      t.integer  :price, null: false
      t.timestamps
    end
  end
end