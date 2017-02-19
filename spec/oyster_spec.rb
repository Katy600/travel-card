require 'oyster'
require 'journey'

describe Oyster do
  let(:journey) {Journey.new}
  let(:oyster) {Oyster.new(journey)}
  it 'has no money on the card' do
    expect(oyster.balance).to eq 5
  end
describe "#top_up" do

  it 'can be topped up' do
    oyster.top_up(5)
    expect(oyster.balance).to eq 10
  end

  it 'can top up the balance' do
    expect{ oyster.top_up 1 }.to change{ oyster.balance }.by 1
  end
end
  describe "#maximum_balance" do
    xit 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oyster::MAXIMUM_BALANCE
      oyster.top_up(maximum_balance)
      expect{ oyster.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded."
    end
  end

  describe "#touch_in" do
    it 'knows that it is on a journey when it touches in' do
      oyster.touch_in("Holborn")
      expect(oyster.in_use).to eq true
    end
  end

  describe "#touch_out" do
    it 'knows that it is not on a journey when it touches out' do
      oyster.touch_out
      expect(oyster.in_use).to eq false
    end
    it 'charges the correct amount' do
      oyster.touch_in("Holborn")
      expect{ oyster.touch_out }.to change{ oyster.balance }.by(-Oyster::MINIMUM_CHARGE)
    end
  end

  describe "#in_journey?" do
    it 'allows you to check if it is on a journey' do
      oyster.touch_out
      expect(oyster).not_to be_in_journey
    end
  end

  describe "#minimum_balance" do
    it 'raises an error if their is less than £1' do
      5.times {oyster.touch_out}
      expect{ oyster.touch_in("Holborn") }.to raise_error "Insufficient balance to touch in."
    end
  end
end
