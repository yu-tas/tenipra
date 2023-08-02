class Menu < ApplicationRecord
  rails_admin do
  end
  belongs_to :difficulty_level
end
