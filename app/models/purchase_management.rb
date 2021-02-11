class PurchaseManagement < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one    :shipping_address

  include ActiveModel: :Model
  attr_accessor :user, :item

end