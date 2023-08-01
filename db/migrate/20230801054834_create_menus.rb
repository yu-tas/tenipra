class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :title
      t.text :description
      t.string :video_link
      t.integer :difficulty_level_id
      t.integer :practice_duration
      t.integer :sets
      t.integer :player_count

      t.timestamps
    end
  end
end
