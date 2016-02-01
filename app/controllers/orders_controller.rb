class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new()
    @order.user_id = current_user.id
    @order.shopping_cart_id = session[:shopping_cart_id]
    if @order.save
      redirect_to @order.paypal_url(order_path(@order))
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end


  protect_from_forgery except: [:hook]
  def hook
    Rails.logger.info(params.inspect)
    params.permit!
    status = params[:payment_status]
    if status == "Completed"
      @order = Order.find(params[:invoice])
      @order.update_attributes status: status, transaction_id: params["txn_id"], purchased_at: Time.now
      user_id = @order.user_id
      @user = User.find(user_id)
      @user.update_attributes name: params[:address_name], country: params[:address_country_code], street: params[:address_street], postcode: params[:address_zip], city: params[:address_city]
      @cart = ShoppingCart.create
      session[:shopping_cart_id] = @cart.id
    end
    render nothing: true
  end

  private
  def order_params
    params.require(:order).permit(:completed, :status, :transaction_id, :user_id, :shopping_cart_id, :purchased_at)
  end
end
