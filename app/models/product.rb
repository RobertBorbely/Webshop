class Product < ActiveRecord::Base
  belongs_to :category
  has_attached_file :image, styles: { tumbnail: "150x150", medium: "600x600", large: "1920x1080"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
		slug.blank? || name_changed?
	end
end
