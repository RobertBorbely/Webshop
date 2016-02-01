ActiveAdmin.register Order do
  permit_params :completed, :status, :user_id

  # controller do
  #   def find_resource
  #     scoped_collection.find(params[:id])
  #   rescue ActiveRecord::RecordNotFound
  #     scoped_collection.find(params[:id])
  #   end
  # end


  index do
    selectable_column
    id_column
    column :completed
    column :status
    column :transaction_id
    column :purchased_at
    actions
  end

  filter :completed

  form do |f|
    f.inputs "Products details" do
      f.input :completed
    end
    f.actions
  end

  show do |order|
    attributes_table do
      row :completed
      row :status       
      row :transaction_id
      row :purchased_at
      row :user_id,:as => :select, :collection => User.name
    end
  end

end