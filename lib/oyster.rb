class Oyster
MAXIMUM_BALANCE = 90
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
    @in_use = true
  end
end
