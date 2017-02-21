require_relative 'journey_log'

class Oyster
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1
PENALTY_FEE = 5

attr_reader :balance, :in_use

  def initialize
    @balance = 5
    @in_use = false
  end

  def top_up(amount)
      fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded." if amount + @balance > MAXIMUM_BALANCE
      @balance += amount
  end

  def new_journey
    @journey_log = JourneyLog.new
  end

  def touch_in(entry_station, entry_zone)
    @in_use == true ? penalty_fee : insufficient_balance?
    new_journey
    @journey_log.entry_journey_details(entry_station, entry_zone)
    @in_use = true
  end

  def touch_out(exit_station, exit_zone)
    return penalty_fee if @in_use == false
    @journey_log.exit_journey_details(exit_station, exit_zone)
    @journey_log.save_journey
    calculate_fair
    deduct
    @in_use = false
  end

  def penalty_fee
    @balance -= PENALTY_FEE
    print "A penality of £#{PENALTY_FEE} has been deducted from your balance. "
  end

  def insufficient_balance?
    fail "Insufficient balance to touch in." if @balance < MINIMUM_BALANCE
  end

  # def entry_journey_details(entry_station, entry_zone)
  #   @start_journey = Hash.new
  #   @start_journey[:entry_station] = entry_station
  #   @start_journey[:entry_zone] = entry_zone
  # end
  #
  # def exit_journey_details(exit_station, exit_zone)
  #   @journey_destination = Hash.new
  #   @journey_destination[:exit_station] = exit_station
  #   @journey_destination[:exit_zone] = exit_zone
  # end
  #
  # def save_journey
  #   @journeys_made << @start_journey.merge(@journey_destination)
  # end
  #
  # def display_journey
  #   @journeys_made.collect {|journey| puts "Entry Station: #{journey[:entry_station]}, Zone:#{journey[:entry_zone]}, Exit Station: #{journey[:exit_station]}, Zone:#{journey[:exit_zone]}" }
  # end
  #
  # def in_journey?
  #   @in_use == true ? true : false
  # end

  def find_zones
    @journey_log.journeys_made.collect do |journey|
    zones =  "#{journey[:entry_zone]} #{journey[:exit_zone]}"
    @integers = zones.split.map {|digit| digit.to_i}
    end
  end

  def calculate_fair
    find_zones
    calculate = (@integers[0]) - (@integers[1])
    calculate.abs + MINIMUM_CHARGE
  end

  def fair
    calculate_fair
  end

private
  def deduct
    @balance -= fair
  end
end
