class PurchaseManagementShippingAddress < ApplicationRecord

  include ActiveModel: :Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase_management_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "can't be blank. Input correctly" } 
    validates :municipality, presence: { message: "can't be blank" }
    validates :address, presence: { message: "can't be blank" }
    alidates :phone_number, format: { with: /\A\d{11}\z/, message: "can't be blank. Input only number" }
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: 'Select' }

  def save
    purchase_management = Purchase_management.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_management_id: purchase_managemet_id)
  end
end
