class Product < ActiveRecord::Base
  belongs_to :category
  has_attached_file :image, styles: { tumbnail: "150x150", medium: "600x600" large: "1920x1080"}
end
