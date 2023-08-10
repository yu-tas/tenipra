class AddPlayerPositionsToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :player_positions, :jsonb, default: []
  end
end
