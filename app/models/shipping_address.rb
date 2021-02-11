class ShippingAddress < ApplicationRecord

  belongs_to :user
  belongs_to :item
  belongs_to :purchase_management

  include ActiveModel: :Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase_management_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "can't be blank", meesage: 'Input correctly' } 
    validates :municipality, presence: { message: "can't be blank" }
    validates :address, presence: { message: "can't be blank" }
    alidates :phone_number, format: { with: /\A\d{11}\z/, message: "can't be blank", message: 'Input only number' }
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: 'Select' }

  def save
    
end
