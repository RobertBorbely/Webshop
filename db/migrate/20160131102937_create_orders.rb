class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :completed
      t.text :notification_params
      t.string :status
      t.string :transaction_id
      t.datetime :purchased_at
      t.references :shopping_cart, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
