class PurchaseManagement < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one    :shipping_address
  belongs_to :order

  include ActiveModel: :Model
  attr_accessor :user, :item

end