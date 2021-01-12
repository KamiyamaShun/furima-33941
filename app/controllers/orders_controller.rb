class OrdersController < ApplicationController
  def index
    @history_order = HistoryOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @history_order = HistoryOrder.new(history_params)
    @item = Item.find(params[:item_id])
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
end
