class Category < ActiveRecord::Base
	has_many :products, :dependent => :destroy
  has_attached_file :image, styles: { tumbnail: "150x150", medium: "600x600", large: "1920x1080"},
    :url => "/system/:attachment/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def should_generate_new_friendly_id?
		slug.blank? || name_changed?
	end

	extend FriendlyId
	friendly_id :name, use: :slugged
end
