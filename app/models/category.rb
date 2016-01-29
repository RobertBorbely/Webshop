class Category < ActiveRecord::Base
	has_many :products, :dependent => :destroy

	def should_generate_new_friendly_id?
		slug.blank? || name_changed?
	end

	extend FriendlyId
	friendly_id :name, use: :slugged
end
