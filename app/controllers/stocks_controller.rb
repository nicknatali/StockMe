class StocksController < ApplicationController 
    
    def search
        #ticker passed in (hash)
        if params[:stock]
            @stock = Stock.find_by_ticker(params[:stock]) #check db for search
            #if stock has already been searched for use that if not, it's new
            @stock ||= Stock.new_from_lookup(params[:stock]) 
        end
        
        if @stock
            #display what @stock is
            #render json: @stock
            render partial: 'lookup'
        else
            render status: not_found, nothing: true
        end 
        
    end 
    
    
end 