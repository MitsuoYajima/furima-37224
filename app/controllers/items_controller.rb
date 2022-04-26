class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:new]
  before_action :set_item, only: [:edit]
  before_action :move_to_index, except: [:index, :show, :update]

  def index
    @items = Item.all
  end

  # def destroy
  # end

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def contributor_confirmation
    redirect_to new_user_session_path unless current_user
  end

  def item_params
    params.require(:item).permit(:image,:title,:explanation,:category_id,:condition_id,:delivery_charge_id,:prefecture_id,:days_to_ship_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user == @item.user
  end
end
