class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!, only: :create

  def index
    @item = Item.find(params[:item_id])
    if customer_signed_in?
      @comment = current_customer.comments.new
    end
    # @comments = @item.comments


  end

  def create
    @item = Item.find(params[:item_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.item_id = @item.id
    if @comment.save
      redirect_to request.referer
    else
      render "index"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:customer_id, :item_id, :comment, :rate, :nick_name)
    end
end
