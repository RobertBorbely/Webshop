ActiveAdmin.register Product do
  permit_params :name, :description, :price, :count, :image, :slug, :category_id, :slider, :featured

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      scoped_collection.find(params[:id])
    end
  end


  index do
    selectable_column
    id_column
    column :name
    column :price
    column :count
    column :image
    column :category_id
    column :slider
    column :featured
    actions
  end

  filter :name
  filter :price
  filter :category_id
  filter :featured
  filter :slider

  form do |f|
    f.inputs "Products details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :count
      f.input :image
      f.input :category_id
      f.input :featured
      f.input :slider
    end
    f.actions
  end

end