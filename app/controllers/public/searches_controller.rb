class Public::SearchesController < ApplicationController
	def search
    @range = params[:range]
    @range == "Item"
    @items = Item.looks(params[:search],params[:word])
  end
end