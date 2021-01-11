class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_instance, only: [:show, :edit]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :ship_fee_id, :prefecture_id, :ship_date_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def set_instance
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user.id
    redirect_to root_path
    end
  end
end
