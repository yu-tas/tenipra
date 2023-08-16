class Menu < ApplicationRecord
  rails_admin do
  end
  belongs_to :difficulty_level
  # belongs_to :user
  has_one_attached :video
  validates :difficulty_level, presence: true
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :menu_labels, dependent: :destroy
  has_many :labels, through: :menu_labels
  def self.ransackable_attributes(auth_object = nil)
    %w[title description practice_duration sets player_count] + _ransackers.keys
  end

  def self.ransackable_associations(auth_object = nil)
    %w[difficulty_level]
  end

end
