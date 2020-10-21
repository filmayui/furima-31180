class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def update

    @item.update(item_params)
    if @item.valid?
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
    end
    
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :category_id, :sales_status_id, :shopping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
