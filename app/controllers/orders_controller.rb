class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order = PurchaseManagementShippingAddress.new
    @item = PurchaseManagementShippingAddress.new
  end

  def create
    @purchase_management_shippingaddress = PurchaseManagementShippingAddress.new(purchase_management_params)
    if purchase_management_shippingaddress.valid?
      @purchase_management_shippingaddress.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_management_params
    params.require(:purchase_management_shippingaddress).permit(:postal_code, :shipping_area, :municipality, :address, :builing_name, :phone_number).merge(user_id: current_user.id)
  end
end
