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

  def touch_in(entry_station: nil, entry_zone: 0)
    fail "Insufficient balance to touch in." if @balance < MINIMUM_BALANCE
    new_journey
    @journey.entry_station = args[:entry_station] = entry_station
    @journey.entry_zone = args[:entry_zone] = entry_zone
    @in_use = true
  end

  def new_journey
    @journey = Journey.new
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @journey.exit_station = station
    save_journey
    @in_use = false
  end

  def save_journey
    @journeys_made << @journey
  end

  def display_journey
    @journeys_made.each {|journey| puts "Start Station: #{journey.entry_station}, End Station: #{journey.exit_station},  "}
  end

  def in_journey?
    @in_use == true ? true : false
  end

private
  def deduct(amount)
    @balance -= amount
  end

end
