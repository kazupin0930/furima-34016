class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :day_to_area
  belongs_to :shipping_area
  belongs_to :shipping_charge
  belongs_to :condition
  belongs_to :category
  belongs_to :user
  has_one    :purchase_management
  has_one_attached :image

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 } 


  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :shipping_area_id, presence: true
  validates :day_to_ship_id, presence: true
  validates :price, presence: true
end
