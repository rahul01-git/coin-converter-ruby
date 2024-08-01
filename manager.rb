require 'uri'
require 'net/http'
require 'json'
require './coin'

class Manager 
  @@repo = {}

  def initialize
    initialize_repo
  end

  def initialize_repo
    response = web_scrap
    json = JSON.parse(response)
    for symbol, values in json
      coin = Coin.new(symbol,values['USD'], values['EUR'], values['INR'], values['AUD'] )
      @@repo[symbol] = coin
    end
  end

  def web_scrap
    url = 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,XRP,DASH,LTC&tsyms=USD,EUR,INR,AUD'
    uri = URI(url)
    Net::HTTP.get(uri)
  end

  def coin_list
    @@repo.keys
  end

  def calculate(amount, symbol, to)
    coin = @@repo[symbol]
    amount * coin.send(to.to_sym)
  end
end