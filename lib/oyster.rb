class Oyster

attr_reader :amount_on_card

  def initialize
    @amount_on_card = 5
  end

  def top_up(amount)
    @amount_on_card += amount
  end
end
