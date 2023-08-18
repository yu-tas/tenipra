class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 100 }
  validates :password, length: { in: 6..100 }, if: :password_required?
    rails_admin do
    configure :encrypted_password do
      hide
    end
  end
  has_one_attached :profile_image
  has_many :favorites, dependent: :destroy
  has_many :favorite_menus, through: :favorites, source: :menu
  has_many :menus
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validate :profile_image_size_validation

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

  private

  def profile_image_size_validation
    if profile_image.attached?
      errors[:profile_image] << "should be less than 2MB" if profile_image.blob.byte_size > 2.megabytes
    end
  end
  
  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
  
end
