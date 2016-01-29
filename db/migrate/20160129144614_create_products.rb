class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :count
      t.references :category, index: true, foreign_key: true
      t.attachment :image

      t.timestamps null: false
    end
  end
end
