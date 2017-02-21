require 'oyster'

describe Oyster do

  let(:journey) {Journey.new}
  let(:oyster) {Oyster.new}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

describe "#initialize" do
  it 'starts with a balance of 5' do
    expect(oyster.balance).to eq 5
  end

  it 'starts with an empty numbery of journeys made' do
    expect(oyster.journeys_made).to be_empty
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
    xit 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oyster::MAXIMUM_BALANCE
      oyster.top_up(maximum_balance)
      expect{ oyster.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded."
    end
  end

  describe "#touch_in" do
    it 'knows that it is on a journey when it touches in' do
      oyster.touch_in(entry_station, 3)
      expect(oyster.in_use).to eq true
    end
  end

  describe "#save_journey_entry_data" do
    it "saves the entry station and entry zone information" do
      #  allow(oyster).to receive(touch_in).and_return(entry_station, 3)
      #  allow(oyster).to receive(touch_out).and_return(entry_station, 4)
      oyster.touch_in(entry_station, 3)
      oyster.touch_out(exit_station, 4)
      journey = oyster.journeys_made.first
      expect(journey[:entry_station]).to eq(entry_station)
      expect(journey[:entry_zone]).to eq(3)
    end
  end

  describe "#save_journey_exit_data" do
    xit "saves the exit station and exit zone information" do
       oyster.touch_in(entry_station, 3)
       oyster.touch_out(exit_station, 4)
      expect(journey.exit_station).to eq(exit_station)
      expect(journey.exit_zone).to eq(4)
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
  end

  describe "#save_journey" do
  let(:a_journey) { {entry_station: entry_station, exit_station: exit_station}}
    xit 'stores a journey' do
      oyster.touch_in(entry_station, 3)
      oyster.touch_out(exit_station, 3)
      expect(oyster.journeys_made).to include a_journey
    end
  end

  describe "#in_journey?" do
    it 'allows you to check if it is on a journey' do
      oyster.touch_in(entry_station, 3)
      oyster.touch_out(exit_station, 3)
      expect(oyster).not_to be_in_journey
    end
  end

  describe "#minimum_balance" do
    it 'raises an error if their is less than £1' do
      5.times {oyster.touch_in(entry_station, 3)}
      5.times {oyster.touch_out(exit_station, 3)}
      expect{ oyster.touch_in(entry_station, 3) }.to raise_error "Insufficient balance to touch in."
    end
  end
end
