class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :day_to_ship
  belongs_to :shipping_area
  belongs_to :shipping_charge
  belongs_to :condition
  belongs_to :category
  belongs_to :user
  has_one    :purchase_management
  has_one_attached :image

  validates :image, presence: true
  
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :shipping_area_id, numericality: { other_than: 1 } 
  validates :day_to_ship_id, numericality: { other_than: 1 }
  
  validates :item_name, presence: true
  validates :description, presence: true

  with_options presence: true, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ } do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
  
  def was_attached?
    self.image.attached? 
  end
  
end