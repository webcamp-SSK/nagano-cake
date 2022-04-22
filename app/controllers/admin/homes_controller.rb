class Admin::HomesController < ApplicationController
  def top
    if params[:status]
      @status = params[:status]
      @order_status = Order.where(status: @status)
      # @order_status.status_i18n
      # debugger
      @orders = @order_status.page(params[:page]).per(10)
    else
      @orders = Order.all.page(params[:page]).per(10)
    end
  end
end
