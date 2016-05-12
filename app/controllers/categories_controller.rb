class CategoriesController < ApplicationController
  before_action :find_by_id, only: [:show]
  
	def index
		@categories = Category.all
	end

	def show
    @products = @category.products.order("created_at desc")
  end

  private
    def find_by_id
      @category = Category.friendly.find(params[:id])
    end
end
