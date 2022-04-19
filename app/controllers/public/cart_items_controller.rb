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
  end

  def all_destroy
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
    end

end
