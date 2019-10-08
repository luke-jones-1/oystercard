require 'station'

class Journey

  attr_reader :current_journey


  MIN_FARE = 2
  PENALTY_FARE = 6



  def initialize
    @current_journey = {:starting_station => nil, :ending_station => nil}
  end

  def start(start_station)
    @current_journey[:starting_station] = start_station
  end

  def end(end_station)
    @current_journey[:ending_station] = end_station
  end

  def fare
    return MIN_FARE if complete?
    return PENALTY_FARE
  end

  def complete?
    !(@current_journey[:starting_station] == nil) && !(@current_journey[:ending_station] == nil)
  end

end
