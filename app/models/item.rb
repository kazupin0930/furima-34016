class Item < ApplicationRecord

  belongs_to :user
  belongs_to :purchase
  belongs_to :shipping

end