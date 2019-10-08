require 'journey'

class Oystercard
  attr_accessor :balance, :stations, :starting_station, :journey
  CARD_MAX_LIMIT = 90
  CARD_MIN_LIMIT = 1
  MIN_FARE = 2

  def initialize
    @balance = 0
    @stations = []
    @journey = Journey.new
  end

  def top_up(money)
    fail "Card limit is £#{CARD_MAX_LIMIT}" if @balance + money > CARD_MAX_LIMIT
    @balance += money
  end

  def touch_in(station)
    @journey.start(station)
  end

  def touch_out(station = "Bakerloo")
    @journey.end(station)
    deduct
    journey_history

  end

  def in_journey?
    !(@journey.complete?)
  end

  private

  def deduct
    fail "insufficient funds £#{CARD_MIN_LIMIT}" if @balance - @journey.fare < CARD_MIN_LIMIT
    @balance -= @journey.fare
  end

  def journey_history
    @stations << journey
  end

end
