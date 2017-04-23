class Stock < ActiveRecord::Base
  
  has_many :user_stocks
  has_many :users, through: :user_stocks
  
  #Find stock by ticker
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
  
  #For looking up the stock
  def self.new_from_lookup(ticker_symbol)
    #Create variable to look up the stock
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    #make sure it exists
    return nil unless looked_up_stock.name
    
    #create a new stock
    new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
    new_stock.last_price = new_stock.price
    new_stock
  end
  
  
  def price
    #If closing price is valid
    closing_price = StockQuote::Stock.quote(ticker).close
    #if it exists, return it
    return "#{closing_price} (Closing)" if closing_price
    
    #If no closing check opening price
    opening_price = StockQuote::Stock.quote(ticker).open
    #if it exists, return it
    return "#{opening_price} (Opening)" if opening_price
    'Unavailable'
  end
end
