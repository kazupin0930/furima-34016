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

  validates :image, attached_file_number: { maximum: 1 }
  validates :title, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :shipping_area_id, numericality: { other_than: 1 } 
  validates :day_to_ship_id, numericality: { other_than: 1 }


  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :shipping_area_id, presence: true
  validates :day_to_ship_id, presence: true
  with_options presence: true, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  def was_attached?
    self.image.attached? 
  end
end
