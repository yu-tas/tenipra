class ChangeUserIdOnMenus < ActiveRecord::Migration[6.1]
  def change
    change_column_null :menus, :user_id, true
  end
end
