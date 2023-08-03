class Menu < ApplicationRecord
  rails_admin do
  end
  belongs_to :difficulty_level
  has_one_attached :video
  validates :difficulty_level, presence: true
end
