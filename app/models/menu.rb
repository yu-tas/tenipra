class Menu < ApplicationRecord
  rails_admin do
  end
  belongs_to :difficulty_level
  has_one_attached :video
  validates :difficulty_level, presence: true
  def self.ransackable_attributes(auth_object = nil)
    %w[title description practice_duration sets player_count] + _ransackers.keys
  end

  def self.ransackable_associations(auth_object = nil)
    %w[difficulty_level]
  end
end
