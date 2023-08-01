class CreateDifficultyLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :difficulty_levels do |t|
      t.string :step
      t.text :description

      t.timestamps
    end
  end
end
