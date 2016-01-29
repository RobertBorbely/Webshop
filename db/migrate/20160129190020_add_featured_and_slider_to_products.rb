class AddFeaturedAndSliderToProducts < ActiveRecord::Migration
  def change
    add_column :products, :featured, :boolean, :default => false
    add_column :products, :slider, :boolean, :default => false
  end
end
