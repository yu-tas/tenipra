class Label < ApplicationRecord
  has_many :menu_labels, dependent: :destroy
  has_many :menus, through: :menu_labels
end
