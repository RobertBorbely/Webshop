ActiveAdmin.register Menu do

  permit_params :id, :title, :place, :priority, :url

  menu :parent => "Menus"
  filter :title
  filter :place
  
  #form :partial => 'form'
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "" do
      f.input :title, :input_html => {:rows => 1}
      f.input :place, :as => :select, :collection => [['Header', 1],
      ['Footer', 2]
  ]
      f.input :priority, :as => :select, :collection => (1 .. 20)
      f.input :url
    end
    f.actions
  end

  index do
    column :title
    column :place
    column :url
    actions
  end

  show do
    attributes_table do
      row :title
      row :url
      row :place
    end
  end
      
end