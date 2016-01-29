class MenuItem < ActiveRecord::Base
  belongs_to :menu

  belongs_to :parent_menu_item, class_name: 'MenuItem'
  has_many :submenu_items, class_name: 'MenuItem', foreign_key: 'parent_menu_item_id'
  
  scope :not_submenu_item, -> { where(parent_menu_item_id: nil) }
  
  belongs_to :menu

  scope :ordered_by_priority, -> { order( priority: :asc) }
  
end
