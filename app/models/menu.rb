class Menu < ActiveRecord::Base
  has_many :menu_items
  HEADER_MENU_COUNT = 2
  BOTTOM_MENU_COUNT = 2

  validate :header_menu_size
  validate :bottom_menu_size

  scope :header_menus, -> { where(place: 1) }
  scope :bottom_menus, -> { where(place: 2) }

  scope :ordered_by_priority, -> { order( priority: :asc) }

  private
  def header_menu_size
    errors.add(:base, "You want than #{HEADER_MENU_COUNT} header menu link") if place.eql?(1) && Menu.header_menus.count>=HEADER_MENU_COUNT
  end

  def bottom_menu_size
    errors.add(:base, "You want than #{BOTTOM_MENU_COUNT} bottom menu link") if place.eql?(2) && Menu.bottom_menus.count>=BOTTOM_MENU_COUNT
  end
end
