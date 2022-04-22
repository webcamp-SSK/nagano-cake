class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order = Order.new
  end

  def create
    @item = Item.find(params[:cart_item][:item_id])
    if current_customer.cart_items.find_by(item_id: @item.id)
      @new_cart_item = CartItem.new(cart_item_params)
      @cart_item = current_customer.cart_items.find_by(item_id: @item.id)
      @cart_item.amount += @new_cart_item.amount
      @cart_item.save
      flash[:notice] = "カートに商品が追加されました"
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      if @cart_item.save
        flash[:notice] = "カートに商品が追加されました"
        redirect_to cart_items_path
      else
        @genres = Genre.all
        flash[:notice] = "商品の個数を選択してください"
        render template: 'public/items/show'
      end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "商品の数量が更新されました"
      redirect_to request.referer
    else
      render :index
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    flash[:notice] = "カートの商品が削除されました"
    redirect_to request.referer
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    flash[:notice] = "カートの商品が全て削除されました"
    redirect_to request.referer
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
    end

end
