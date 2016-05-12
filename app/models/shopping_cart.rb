class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart

  has_one :order

  accepts_nested_attributes_for :shopping_cart_items, allow_destroy: true

  attr_accessor :shopping_carts_id

end
