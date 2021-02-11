class Order < ApplicationRecord

  belongs_to :item
  belongs_to :purchase_management
  belongs_to :shipping_adsress
  belongs_to :user
end
