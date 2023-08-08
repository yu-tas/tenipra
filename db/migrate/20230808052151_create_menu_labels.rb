class CreateMenuLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_labels do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
