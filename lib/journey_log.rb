require_relative 'oyster'
class JourneyLog

  attr_reader :journeys_made

  def initialize
     @journeys_made = []
  end

  def entry_journey_details(entry_station, entry_zone)
    @start_journey = Hash.new
    @start_journey[:entry_station] = entry_station
    @start_journey[:entry_zone] = entry_zone
  end

  def exit_journey_details(exit_station, exit_zone)
    @journey_destination = Hash.new
    @journey_destination[:exit_station] = exit_station
    @journey_destination[:exit_zone] = exit_zone
  end

  def save_journey
    @journeys_made << @start_journey.merge(@journey_destination)
  # p @journeys_made
  end

  def display_journey
    @journeys_made.collect {|journey| puts "Entry Station: #{journey[:entry_station]}, Zone:#{journey[:entry_zone]}, Exit Station: #{journey[:exit_station]}, Zone:#{journey[:exit_zone]}" }
  end

  def in_journey?
    @in_use == true ? true : false
  end
end
