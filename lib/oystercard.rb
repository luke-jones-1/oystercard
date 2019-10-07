class Oystercard
  attr_accessor :balance
  CARD_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Card limit is #{CARD_LIMIT}" if @balance + money > CARD_LIMIT
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end
end
