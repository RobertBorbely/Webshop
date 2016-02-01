class Product < ActiveRecord::Base
  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :attachments

  has_attached_file :image, styles: { tumbnail: "150x150", medium: "600x600", large: "1920x1080"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  accepts_nested_attributes_for :attachments, allow_destroy: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
		slug.blank? || name_changed?
	end

  def self.search(search)
    wildcard_search = "%#{search}%"
    if search
      where('name LIKE :search', search: wildcard_search)
    else
      all
    end
  end

end
