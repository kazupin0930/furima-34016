class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :purchase_managements

         validates :nickname, presence: true
         validates :last_name, presence: true 
         validates :first_name, presence: true 
         validates :last_name_frigana, presence: true 
         validates :first_name_frigana, presence: true 
         validates :date_of_birth, presence: true 
end
