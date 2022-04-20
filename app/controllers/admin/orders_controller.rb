class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def show
    @order = Order.find(params[:id])
    @customer = Customer.find_by(params[order_id: @order.id])
    @order_detail = OrderDetail.new
    @order_detail.order_id = @order.id

  end

  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:order][:order_id])
    if @order.update(order_params) || @order_detail.update(order_detail_params)
      redirect_to request.referer
    else
      render :show
    end
  end

  private

    def order_params
      params.require(:order).permit(:status)
    end

    def order_detail_params
      params.require(:order_detail).permit(:making_status)
    end

end
