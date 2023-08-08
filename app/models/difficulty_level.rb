class DifficultyLevel < ApplicationRecord
  has_many :menus
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "step", "updated_at"]
  end
  
  def to_s
    step
  end
end
