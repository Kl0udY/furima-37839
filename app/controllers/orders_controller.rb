class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
