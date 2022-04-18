class Admin::HomesController < ApplicationController
  def top
    @items = Item.all.page(params[:page]).per(10)
  end
end
