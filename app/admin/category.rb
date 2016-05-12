ActiveAdmin.register Category do
  permit_params :name, :description, :image, :slug

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
    column :description
    actions
  end

  filter :name

  form do |f|
    f.inputs "Categories details" do
      f.input :name
      f.input :description
      f.input :parent_id
      f.input :image
    end
    f.actions
  end

end