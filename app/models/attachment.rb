class Attachment < ActiveRecord::Base
  belongs_to :products, polymorphic: true

  has_attached_file :image, styles: { tumbnail: "150x150", medium: "600x600", large: "1920x1080"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
