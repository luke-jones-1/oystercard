
class Oystercard
  attr_accessor :balance, :in_journey, :stations
  CARD_MAX_LIMIT = 90
  CARD_MIN_LIMIT = 1
  MIN_FARE = 2

  def initialize
    @balance = 0
    @in_journey = nil
    @stations = []
  end

  def top_up(money)
    fail "Card limit is £#{CARD_MAX_LIMIT}" if @balance + money > CARD_MAX_LIMIT
    @balance += money
  end

  def touch_in(station)
    @starting_station = station
  end

  def touch_out(money = MIN_FARE, ending_station = "Bakerloo")
    deduct(money)
    @stations << {:starting_station => @starting_station, :ending_station => ending_station}
    @starting_station = nil
  end

  def in_journey?
    @in_journey = (@starting_station != nil)
  end

  private

  def deduct(money)
    fail "insufficient funds £#{CARD_MIN_LIMIT}" if @balance - money < CARD_MIN_LIMIT
    @balance -= money
  end

end
