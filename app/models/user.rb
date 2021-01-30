class User < ApplicationRecord

  has_many :items
  has_many :shipping_addresses
  has_many :purchase_managements
  
end