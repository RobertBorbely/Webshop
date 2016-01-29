ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role, :name, :country, :postcode, :city, :street

  index do
    selectable_column
    id_column
    column :name
    column :current_sign_in_at
    column :email
    column :created_at
    column :role
    actions
  end

  filter :name
  filter :county
  filter :city

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :country
      f.input :city
      f.input :street
      f.input :postcode
      f.input :role, as: :radio, collection: {User: "user", Administrator: "admin"}
    end
    f.actions
  end

end
