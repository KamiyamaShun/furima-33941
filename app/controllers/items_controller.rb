class ItemsController < ApplicationController
  def index
  end
  
  def create
  end

  def new
    @item = Item.new
  end

  private
  # def item_params
  #   params.require(:items).permit(:name, :info, :category_id, :status_id, :ship_fee_id, :prefecture_id, :ship_date_id, :price, :image),merge(user_id: current_user.id)
  # end
end
