class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :title
      t.string :url
      t.integer :priority, default: 1
      t.references :menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
