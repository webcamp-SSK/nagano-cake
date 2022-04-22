class Admin::HomesController < ApplicationController
  def top
    if params[:status]
      @orders = Order.where(params[:status]).page(params[:page]).per(10)
    else
      @orders = Order.all.page(params[:page]).per(10)
    end
  end
end
