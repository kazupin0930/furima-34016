class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if @item.purchase_management.present? || current_user.id == @item.user_id
    @order = PurchaseManagementShippingAddress.new
  end

  def create
    @order = PurchaseManagementShippingAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase_management_shipping_address).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 秘密鍵
    Payjp::Charge.create(
      amount: set_item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
