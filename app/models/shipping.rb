class Shipping < ApplicationRecord

  belongs_to :user
  belongs_to :item
  belongs_to :purchase

end
