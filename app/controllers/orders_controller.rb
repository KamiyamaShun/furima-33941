class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :move_to_root]
  before_action :move_to_root, only: [:index, :create]

  def index
    @history_order = HistoryOrder.new
    # @item = Item.find(params[:item_id])
  end

  def create
    @history_order = HistoryOrder.new(history_params)
    # @item = Item.find(params[:item_id])
    if @history_order.valid?
      @history_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def history_params
    params.require(:history_order).permit(:post_number, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
