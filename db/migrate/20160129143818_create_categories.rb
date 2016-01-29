class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.products :has_many

      t.timestamps null: false
    end
  end
end
