ActiveAdmin.register Page do
  permit_params :title, :content, :slug

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
    column :title
    column :content
    actions
  end

  filter :title

  form do |f|
    f.inputs "Pages details" do
      f.input :title
      f.input :content
      f.input :slug
    end
    f.actions
  end

end