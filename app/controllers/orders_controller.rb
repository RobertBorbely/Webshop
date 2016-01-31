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
    params.permit!
    status = params[:payment_status]
    if status == "SUCCESS"
      @order = Order.find(params[:invoice])
      @order.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end

  private
  def order_params
    params.require(:order).permit(:completed, :status, :transaction_id, :user_id, :shopping_cart_id, :purchased_at)
  end
end
