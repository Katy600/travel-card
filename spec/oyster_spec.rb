require 'oyster'

describe Oyster do

  let(:journey) {JourneyLog.new}
  let(:oyster) {Oyster.new(journey)}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

describe "#initialize" do
  it 'starts with a balance of 5' do
    expect(oyster.balance).to eq 5
  end
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
    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = 90
      expect{ oyster.top_up(95) }.to raise_error "Maximum balance of #{maximum_balance} exceeded."
    end
  end

  describe "#touch_in" do
    it 'knows that it is on a journey when it touches in' do
      oyster.touch_in(entry_station, 3)
      expect(oyster.in_use).to eq true
    end

    it 'charges a penalty fee of 5 if the user touches in twice' do
      oyster.top_up(5)
      oyster.touch_in(entry_station, 3)
      oyster.touch_in(entry_station, 3)
      expect(oyster.balance).to eq 5
    end
  end

  describe "#touch_out" do
    it 'knows that it is not on a journey when it touches out' do
      oyster.touch_in(entry_station, 3)
      oyster.touch_out(exit_station, 3)
      expect(oyster.in_use).to eq false
    end

    it 'charges the correct amount' do
      oyster.touch_in(entry_station, 3)
      expect{ oyster.touch_out(exit_station, 3) }.to change{ oyster.balance }.by(-Oyster::MINIMUM_CHARGE)
    end

    it 'charges a penalty fee of 5 if the user touches out twice' do
      oyster.top_up(5)
      expect {oyster.touch_out(entry_station, 3)}.to change {oyster.balance}.by(-5)
    end
  end

  describe "#minimum_balance" do
    it 'raises an error if their is less than £1' do
      5.times {oyster.touch_in(entry_station, 3)}
      5.times {oyster.touch_out(exit_station, 3)}
      expect{ oyster.touch_in(entry_station, 3) }.to raise_error "Insufficient balance to touch in."
    end
  end

  describe "#fair" do
    it 'calculates the total cost of a journey' do
      oyster.touch_in(entry_station, 1)
      oyster.touch_out(exit_station, 3)
      expect(oyster.fair).to eq(3)
    end
  end
end
