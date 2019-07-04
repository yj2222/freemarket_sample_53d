class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :likes, dependent: :destroy
  has_one :credit, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :area, dependent: :destroy
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :area
end
