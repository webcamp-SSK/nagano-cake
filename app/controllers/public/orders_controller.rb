class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
  end

  def confirm
    @order = Order.new(order_params)

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif [:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif [:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @oredr.address = params[:order][:address]
      @order.name = params[:name]
    end

  end

  def complete

  end

  private

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    end

end
