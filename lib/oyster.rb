class Oyster

attr_reader :amount_on_card

  def initialize
    @amount_on_card = 5
  end

  def top_up(amount)
    if amount < 90
      @amount_on_card += amount
    else
      "You have reached your maximum amount"
    end
  end
end
