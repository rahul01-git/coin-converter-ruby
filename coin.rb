class Coin 
  attr_accessor :symbol, :USD, :EUR, :INR
  def initialize(symbol, usd, eur, inr)
    @symbol, @USD , @EUR, @INR = symbol, usd , eur, inr
  end
end