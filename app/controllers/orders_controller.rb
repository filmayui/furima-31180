class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    unless current_user.id != @item.user.id && nil == Order.find_by(item_id: @item.id)
      redirect_to root_path
    end
    @user_order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)   
    if @user_order.valid?

      pay_item(@item)

      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item(item)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,  
      card: order_params[:token],    
      currency: 'jpy'             
    )
  end
end
