class AddParentMenuItemIdToMenuItem < ActiveRecord::Migration
  def self.up
    add_column :menu_items, :parent_menu_item_id, :integer
    add_index :menu_items, :parent_menu_item_id
  end

  def self.down
    remove_index :menu_items, :parent_menu_item_id
    remove_column :menu_items, :parent_menu_item_id
  end
end
