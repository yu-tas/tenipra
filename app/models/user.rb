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

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = user.password_confirmation = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.password = user.password_confirmation = SecureRandom.urlsafe_base64
      user.name = 'ゲスト管理者' 
      user.admin = true
    end
  end
end
