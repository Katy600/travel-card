class Oyster
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

attr_reader :balance, :in_use

  def initialize
    @balance = 5
  end

  def top_up(amount)
      fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded." if amount + @balance > MAXIMUM_BALANCE
      @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail "Insufficient balance to touch in." if @balance < 1
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use == true ? true : false
  end
end
