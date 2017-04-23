class StocksController < ApplicationController

  def search
    #ticker passed in (hash)
    if params[:stock]
      #create instance variable for stock by pulling from db
      @stock = Stock.find_by_ticker(params[:stock])
      @stock ||= Stock.new_from_lookup(params[:stock])
    end
    
    #if the stock exists
    if @stock
      #display what @stock is
      #render json: @stock
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end
  end
  
end
