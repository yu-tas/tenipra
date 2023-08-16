class ChangeMenusAddNullFalseToUserId < ActiveRecord::Migration[6.1]
  def change
    change_column_null :menus, :user_id, false
  end
end
