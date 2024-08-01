class Coin 
  attr_accessor :symbol, :USD, :EUR
  def initialize(symbol, usd, eur)
    @symbol, @USD , @EUR = symbol, usd , eur
  end
end