class ItemsController < ApplicationController
before_action :move_to_top, except: :index
before_action :authenticate_user!

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :ship_fee_id, :prefecture_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_top
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
