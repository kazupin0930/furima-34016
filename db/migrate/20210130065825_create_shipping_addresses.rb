class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :postal_code, null: false
      t.integer    :prefectures_id, null: false
      t.text       :municipality, null: false
      t.text       :address, null: false
      t.text       :building_name
      t.string     :phone_number, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end