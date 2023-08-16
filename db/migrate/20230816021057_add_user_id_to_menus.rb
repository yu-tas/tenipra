class AddUserIdToMenus < ActiveRecord::Migration[6.1]
  def change
    add_reference :menus, :user, foreign_key: true
  end
end
