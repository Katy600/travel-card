require_relative 'journey'

class Oyster
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1

attr_reader :balance, :in_use, :journeys_made

  def initialize
    @balance = 5
    @journeys_made = []
  end

  def top_up(amount)
      fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded." if amount + @balance > MAXIMUM_BALANCE
      @balance += amount
  end

  def touch_in(entry_station, entry_zone)
    fail "Insufficient balance to touch in." if @balance < MINIMUM_BALANCE
    new_journey
    save_journey_entry_data(entry_station, entry_zone)
    @in_use = true
  end

  def save_journey_entry_data(entry_station, entry_zone)
    @journey.entry_station = entry_station
    @journey.entry_zone = entry_zone
  end

  def new_journey
    @journey = Journey.new
  end

  def touch_out(exit_station, exit_zone)
    deduct(MINIMUM_CHARGE)
    save_journey_exit_data(exit_station, exit_zone)
    save_journey
    @in_use = false
  end

  def save_journey_exit_data(exit_station, exit_zone)
    @journey.exit_station = exit_station
    @journey.exit_zone = exit_zone
  end

  def save_journey
    @journeys_made << @journey
  end

  def display_journey
    @journeys_made.each {|journey| puts "Entry Station: #{journey.entry_station}, Zone:#{journey.entry_zone}, Exit Station: #{journey.exit_station}, Zone:#{journey.exit_zone}  "}
  end

  def in_journey?
    @in_use == true ? true : false
  end

private
  def deduct(amount)
    @balance -= amount
  end

end
