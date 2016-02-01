class ProductsController < ApplicationController
  before_action :find_by_id, only: [:show,:add_to_cart, :clear]
  
  def index
    @products = Product.search(params[:search])
  end

  def show
    if @product.count == 0
      @notavaliable = true
    end
  end

  private 
  	def find_by_id
  		@product = Product.friendly.find(params[:id])
  	end
end
