class ShoppingCartsController < ApplicationController

  before_filter :extract_shopping_cart

  def create
    @product = Product.friendly.find(params[:product_id])
    @shopping_cart.add(@product, @product.price,params[:item_count].to_i)
    redirect_to :back
  end

  def show

  end

  def remove
    @product = Product.friendly.find(params[:product_id])
    @shopping_cart.remove(@product, params[:quantity].present? ? params[:quantity].to_i : 1)
    redirect_to :back
  end

  def my_cart
    render 'show'
  end

  private
    def extract_shopping_cart
      shopping_cart_id = session[:shopping_cart_id]
      @shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
      session[:shopping_cart_id] = @shopping_cart.id
    end

end
