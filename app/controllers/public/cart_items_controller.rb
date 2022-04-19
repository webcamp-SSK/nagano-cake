class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      @item = Item.find(params[:item_id])
      render template: 'public/items/show'
    end
  end

  def update
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to request.referer
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
    end

end
