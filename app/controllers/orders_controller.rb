class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :move_to_root]
  before_action :move_to_root, only: [:index, :create]

  def index
    @history_order = HistoryOrder.new
  end

  def create
    @history_order = HistoryOrder.new(history_params)
    if @history_order.valid?
      pay_item
      @history_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def history_params
    params.require(:history_order).permit(:post_number, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path if current_user.id == @item.user_id
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: history_params[:price],
      card: history_params[:token],
      currency: 'jpy'
    )
  end
end
