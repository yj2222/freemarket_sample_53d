class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  has_one :profile
  has_many :like

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.nickname = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  has_many :products
  has_many :likes, dependent: :destroy
  has_one :credit, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :area, dependent: :destroy
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :area
  has_one :credit
end
