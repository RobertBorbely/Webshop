class WelcomeController < ApplicationController
	def index
    @products_slider = Product.where(slider: true)
    @products_featured = Product.where(:featured => true).order("created_at desc").limit(3)
    @products_recent = Review.where(rating: 5).last.product
	end
end
