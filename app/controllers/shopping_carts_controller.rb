class ShoppingCartsController < ApplicationController

  before_filter :extract_shopping_cart

  def index
  end

  def create
    @product = Product.friendly.find(params[:product_id])
    if @product.count >= params[:item_count].to_i
      @shopping_cart.add(@product, @product.price,params[:item_count].to_i)
      @product.update_attributes count: (@product.count - params[:item_count].to_i)
      redirect_to :back , notice: "Product added to cart!"
    else
      redirect_to :back, notice: "You want to add to much please add less then #{@product.count}!"
    end
    
  end

  def show

  end

  def remove
    @product = Product.friendly.find(params[:product_id])
    @shopping_cart.remove(@product, params[:quantity].present? ? params[:quantity].to_i : 1)
    @product.update_attributes count: (@product.count + 1)
    redirect_to :back, notice: "We reduced your cart succesful!"
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
