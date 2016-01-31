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
    column :user_id
    actions
  end

  filter :completed

  form do |f|
    f.inputs "Products details" do
      f.input :completed
    end
    f.actions
  end

end