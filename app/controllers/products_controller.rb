class ProductsController < ApplicationController
  before_action :find_by_id, only: [:show,:add_to_cart, :clear]
  
  def index
    @products = Product.search(params[:search])
  end

  def show

  end

  def add_to_cart
    @cart = ShoppingCart.create
    @cart_value = @cart.total
    @cart.add(@product, @product.price)
    redirect_to :back
  end

  private 
  	def find_by_id
  		@product = Product.friendly.find(params[:id])
  	end
end
