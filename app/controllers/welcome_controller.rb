class WelcomeController < ApplicationController
	def index
    @products_slider = Product.where(:slider => true)
    @products_featured = Product.where(:featured => true).limit(4)
    @products_recent = Product.all.limit(4).order("created_at desc")
	end
end
