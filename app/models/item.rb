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

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id, numericality: { message: 'Select' }
    validates :condition_id, numericality:  { message: 'Select' }
    validates :shipping_charge_id, numericality: { message: 'Select' }
    validates :shipping_area_id, numericality: { message: 'Select' }
    validates :day_to_ship_id, numericality: { message: 'Select' }
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end

  def was_attached?
    image.attached?
  end
end
