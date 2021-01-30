class User < ApplicationRecord

  has_many :item
  has_many :shipping
  has_many :purchase
  
end
