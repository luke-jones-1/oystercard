require 'station'

class Journey

  attr_reader :current_journey


  MIN_FARE = 1
  PENALTY_FARE = 6



  def initialize()
    @current_journey = {:starting_station => nil, :ending_station => nil}
  end

  def start(start_station)
    @current_journey[:starting_station] = start_station
  end

  def finish(end_station)
    @current_journey[:ending_station] = end_station
  end

  def fare
    if complete?
      diff = @current_journey[:starting_station].zone - @current_journey[:ending_station].zone
      if diff < 0
        diff = (-1*diff)
      end
      return diff + MIN_FARE
    end
    return PENALTY_FARE
  end

  def complete?
    !(@current_journey[:starting_station] == nil) && !(@current_journey[:ending_station] == nil)
  end

end
