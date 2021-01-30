class Item < ApplicationRecord

  belongs_to :user
  belongs_to :purchase_management
  belongs_to :shipping_address

end