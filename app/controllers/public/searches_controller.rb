class Public::SearchesController < ApplicationController
	def search
      @content=params[:content]
      @records=Item.search_for(@content).page(params[:page]).per(6)
  end
end