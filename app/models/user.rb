class User < ApplicationRecord

  has_many :items
  has_many :purchase_managements
  
end