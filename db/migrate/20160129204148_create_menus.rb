class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.integer :place, null: false
      t.integer :priority, default: 1

      t.timestamps null: false
    end
  end
end
