class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:new]

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def index
    @items = Item.all
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
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :shipping_charge_id,
                                 :shipping_area_id, :day_to_ship_id, :price).merge(user_id: current_user.id, seller_id: current_user.id, buyer_id: current_user.id)
  end
end
