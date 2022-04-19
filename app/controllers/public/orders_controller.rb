class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def confirm
    @order = Order.new(order_params)
  end

  def complete

  end

  private

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    end

end
