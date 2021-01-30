class ShippingAddress < ApplicationRecord

  belongs_to :user
  belongs_to :item
  belongs_to :purchase_management

end