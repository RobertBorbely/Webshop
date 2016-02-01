ActiveAdmin.register Product do
  permit_params :name, :description, :price, :count, :image, :slug,
   :category_id, :slider, :featured, attachments_attributes: [ :image, :id, :_destroy ]


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
    column :image do |product|
      image_tag product.image.url(:tumbnail)
    end
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
      f.inputs "Csatolmányok" do
        f.has_many :attachments, allow_destroy: true do |cf|
          cf.input :image, as: :file, required: false
        end
      end
    end
    f.actions
  end

  show do |product|
    attributes_table do
      row :name
      row :description do
        product.description.html_safe
      end
      row :image do
        image_tag product.image.url(:medium)
      end
      row :count
      row :price
      row :slider
      row :featured
      row :category_id,:as => :select, :collection => Category.name
      row :attachments do
        links = ""
        product.attachments.each do |p|
          links+= link_to p.image.url(:tumbnail) , p.image.url(:large)
          links+= "<br/>"
        end
        links.html_safe
      end
    end
  end

end