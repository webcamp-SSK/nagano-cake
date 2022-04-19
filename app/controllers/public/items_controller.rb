class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: 1).page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
