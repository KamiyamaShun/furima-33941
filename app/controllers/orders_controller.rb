class OrdersController < ApplicationController
  def index
    @history_order = HistoryOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @history_order = HistoryOrder.new(history_params)
    if @history_order.valid?
      @history_order.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def history_params
    params.require(:history_order).permit(:post_number, :prefecture_id, :city, :address, :building, :phone_number)
  end
end
