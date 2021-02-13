class Order < ApplicationRecord

  belongs_to :item
  belongs_to :purchase_management
  belongs_to :shipping_adsress
  belongs_to :user

  with_options presence: true do
    validates :card_information, format: { with: /\A[a-z0-9]+\z/ }
    validates :expiration_date, format: { with: /\A[0-9０-９]+\z/ }
    validates :security_code, format: { with: /\A[0-9０-９]+\z/ }
  end
end
