class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchase_managements

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :last_name, presence: true
    validates :first_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_frigana, presence: true
    validates :first_name_frigana, presence: true
  end
  validates :date_of_birth, presence: true
end
