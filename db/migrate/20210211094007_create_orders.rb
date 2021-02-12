class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :card_information, null: false
      t.integer :expiration_date, null: false
      t.string  :security_code, null: false
      t.timestamps
    end
  end
end
