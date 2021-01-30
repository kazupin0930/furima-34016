class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :who_listed, null: false
      t.text       :address, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
