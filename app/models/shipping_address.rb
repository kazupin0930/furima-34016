class ShippingAddress < ApplicationRecord

  belongs_to :user
  belongs_to :item
  belongs_to :purchase_management

  include ActiveModel: :Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase_management_id

  with_options presence: true do
    validates :postal_code
    validates :shipping_area_id
    validates :municipality
    validates :address
    alidates :phone_number
  end
end
