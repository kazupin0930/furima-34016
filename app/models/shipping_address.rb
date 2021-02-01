class ShippingAddress < ApplicationRecord

  belongs_to :user
  belongs_to :item
  belongs_to :purchase_management

  validates :postal_code, presence: true 
  validates :shipping_area_id, presence: true 
  validates :municipality, presence: true 
  validates :address, presence: true 
  validates :building_name
  validates :phone_number, presence: true 
end