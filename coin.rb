class Coin 
  attr_accessor :symbol, :USD, :EUR, :INR, :AUD
  def initialize(symbol, usd, eur, inr, aud)
    @symbol, @USD , @EUR, @INR, @AUD = symbol, usd , eur, inr, aud
  end
end