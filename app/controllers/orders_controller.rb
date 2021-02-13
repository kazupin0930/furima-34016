class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create

    @purchase_management_shipping_address = PurchaseManagementShippingAddress.new(purchase_management_params)
    if @purchase_management_shipping_address.valid?
      @purchase_management_shipping_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_management_params

    params.require(:purchase_management_shipping_address).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase_management_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
