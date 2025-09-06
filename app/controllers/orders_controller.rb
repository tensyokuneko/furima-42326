class OrdersController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_item
  before_action :redirect_if_invalid_access, only: [:index, :create] 


  def index
    @order_address = OrderAddress.new
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']   
  end

  def create

    @order_address = OrderAddress.new(
      order_address_params.merge(token: params[:token]))

      
    if @order_address.valid?
      
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    params
    .require(:order_address)
    .permit(
      :post_code, 
      :prefecture_id, 
      :city, 
      :address, 
      :building, 
      :phone_number, 
      :token
      )
      .merge(
        user_id: current_user.id, 
        item_id: params[:item_id]
      )
  end

  def redirect_if_invalid_access
  
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

  
end

