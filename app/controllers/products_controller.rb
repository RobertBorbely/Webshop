class ProductsController < ApplicationController
  before_action :find_by_id, only: [:show]
  
  def index
  	@products = Product.all
  end

  def show

  end

  private 
  	def find_by_id
  		@product = Product.friendly.find(params[:id])
  	end
end
