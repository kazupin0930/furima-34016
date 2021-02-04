class ItemsController < ApplicationController

  def index
     @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @user = User.new(item_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:nickname, :image, :category_id, :condition_id, :shipping_charge_id).merge(user_id: current_user.id)
  end

end
