class CreateShoppingCartItems < ActiveRecord::Migration
  def change
    create_table :shopping_cart_items do |t|

      t.timestamps null: false
      t.shopping_cart_item_fields
    end
  end
end
