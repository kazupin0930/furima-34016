class CreatePurchaseManagementShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_management_shipping_addresses do |t|

      t.timestamps
    end
  end
end
