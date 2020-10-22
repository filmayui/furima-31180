class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    unless current_user.id != @item.user.id
      redirect_to root_path
    end
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)   
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
