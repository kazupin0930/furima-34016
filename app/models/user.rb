class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchase_managements
  has_many :order

  with_options presence: true, format: { with: /\A[a-zA-Zーぁ-んァ-ン一-龥々]+\z/, message: "can't be blank" } do
    validates :nickname
  end
  PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Full-width charactes' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana charactes' } do
    validates :last_name_frigana
    validates :first_name_frigana
  end
  with_options presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "can't be blank" } do
    validates :date_of_birth
  end
end
