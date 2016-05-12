class ShoppingCartItem < ActiveRecord::Base
  acts_as_shopping_cart_item

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
