class Public::SearchesController < ApplicationController
	def search
      @content=params[:content]
      @records=Item.search_for(@content)

  end
end