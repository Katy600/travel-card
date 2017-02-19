require_relative 'journey'

class Oyster
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1

attr_reader :balance, :in_use

  def initialize(journey)
    @balance = 5
    @journey = journey
  end

  def top_up(amount)
      fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded." if amount + @balance > MAXIMUM_BALANCE
      @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance to touch in." if @balance < MINIMUM_BALANCE
    @in_use = true
    @journey.start_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @in_use = false
    @journey.end_station = station
  end

  def in_journey?
    @in_use == true ? true : false
  end

private
  def deduct(amount)
    @balance -= amount
  end

end
