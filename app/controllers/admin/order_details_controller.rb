class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find_by(id: @order_detail.order_id)
    @order_details = @order.order_details

    @order_detail.update(order_detail_params)
    count = 0
    @order_details.each do |order_detail|
      if order_detail.making_status == "completion"
        count += 1
      end
    end
    if @order_details.count == count
      @order.update_attribute(:status, 3)
    end
    if params[:order_detail][:making_status] == "making"
      @order.update_attribute(:status, 2)
    end
    redirect_to admin_order_path(id: @order_detail.order_id)
  end

  private
    def order_detail_params
      params.require(:order_detail).permit(:making_status)
    end

end
