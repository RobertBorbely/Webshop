ActiveAdmin.register MenuItem do

  permit_params :id, :title, :menu_id, :url, :priority, :user_id, :parent_menu_item_id

  menu :parent => "Menus"
  filter :title
  filter :menu
  filter :priority
  
  #form :partial => 'form'
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "" do
      f.input :title, :input_html => {:rows => 1}
      f.input :menu_id, :as => :select, :collection =>  Menu.all, :label => :title
      f.input :url
      f.input :parent_menu_item_id, :as => :select, :collection => MenuItem.not_submenu_item, :label=> :title, :include_blank => true
      f.input :priority, :as => :select, :collection =>  (1 .. 20)
    end
  f.actions
  end

  index do 
    column :title
    column :menu
    column :priority

    actions

  end

  show do
    attributes_table do
      row :menu
      row :url
      row :priority
    end
  end
  # controller do
  #   def create
  #     @menu_item = MenuItem.new(permitted_params[:menu_item])
  #     @menu_item.user = current_user
  #
  #     respond_to do |format|
  #       if @menu_item.save
  #         format.html { redirect_to(admin_menu_items_path, :notice => 'Menü elem sikeresen létrehozva.') }
  #         format.xml  { render :xml => @menu_item, :status => :created, :location => @menu_item }
  #       else
  #         format.html { render :action => "new" }
  #         format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
  #       end
  #     end
  #   end
    # end
  before_create do |menu_item|
    menu_item=current_user
  end
end
