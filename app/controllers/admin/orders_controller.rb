class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def show
    @order = Order.find(params[:id])
    @customer = Customer.find_by(params[order_id: @order.id])
    @order_detail = @order.order_details.find_by(order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.status == "confirm"
      @order_details.update_all('making_status = 1')
    end
    redirect_to request.referer

  end

  private

    def order_params
      params.require(:order).permit(:status)
    end

    def order_detail_params
      params.require(:order_detail).permit(:making_status)
    end

end
