
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
    start_new_journey(entry_station, entry_zone)
    @in_use = true
  end

  def start_new_journey(entry_station, entry_zone)
    @start_journey = Hash.new
    @start_journey[:entry_station] = entry_station
    @start_journey[:entry_zone] = entry_zone
  end

  def touch_out(exit_station, exit_zone)
    deduct(MINIMUM_CHARGE)
    end_journey(exit_station, exit_zone)
    save_journey
    @in_use = false
  end

  def end_journey(exit_station, exit_zone)
    @journey_destination = Hash.new
    @journey_destination[:exit_station] = exit_station
    @journey_destination[:exit_zone] = exit_zone
  end

  def save_journey
    @journeys_made << @start_journey.merge(@journey_destination)
  end

  def display_journey
    @journeys_made.collect {|journey| puts "Entry Station: #{journey[:entry_station]}, Zone:#{journey[:entry_zone]}, Exit Station: #{journey[:exit_station]}, Zone:#{journey[:exit_zone]}" }
  end

  def in_journey?
    @in_use == true ? true : false
  end

  def calculate_fair
    @journeys_made.collect do |journey|
     zones =  "#{journey[:entry_zone]} #{journey[:exit_zone]}"
     integers = zones.split.map {|digit| digit.to_i}
     calculate = (digit1 = integers[0]) - (digit2 = integers[1])
     fair = calculate.abs + MINIMUM_CHARGE
     p fair
    end
  end

  def display_fair
     calculate_fair[0]
  end

private
  def deduct(amount)
    @balance -= amount
  end

end
