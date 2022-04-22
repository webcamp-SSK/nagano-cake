class Public::CommentsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @comment = current_customer.comments.new
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
      params.require(:comment).permit(:customer_id, :item_id, :comment, :rate)
    end
end
