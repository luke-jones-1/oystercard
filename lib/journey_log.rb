require 'journey'

class JourneyLog

  def initialize
    @journeys = []
  end

  def add_journey(journey)
    fail 'journey not complete' if !(journey.complete?)
    @journeys << journey.current_journey
  end

  def journeys
  @journeys.dup
  end
end
