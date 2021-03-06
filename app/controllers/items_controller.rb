class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_instance, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :sold_out_move, only: :edit

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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
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

  def sold_out_move
  if @item.history.present?
    redirect_to root_path 
  end
  end
end
