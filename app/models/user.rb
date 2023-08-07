class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    rails_admin do
    configure :encrypted_password do
      hide
    end
  end
  has_many :favorites, dependent: :destroy
  has_many :menus
end
