class ProductsController < ApplicationController
  before_action :find_by_id, only: [:show,:add_to_cart]
  
  def index
  	@products = Product.all
  end

  def show

  end

  def add_to_cart
    @cart = Cart.create

    @cart.add(@product, @product.price, @product.count)
  end

  private 
  	def find_by_id
  		@product = Product.friendly.find(params[:id])
  	end
end
