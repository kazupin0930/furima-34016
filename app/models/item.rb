class Item < ApplicationRecord

  belongs_to :user
  has_one    :purchase_management

  validates :name, presence: true 
  validates :description, presence: true 
  validates :category_id, presence: true 
  validates :condition_id, presence: true 
  validates :shipping_charges_id, presence: true 
  validates :shipping_area_id, presence: true 
  validates :day_to_ship_id, presence: true 
  validates :price, presence: true 
end