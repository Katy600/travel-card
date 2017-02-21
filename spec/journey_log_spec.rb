require 'journey_log'
require 'oyster'

describe JourneyLog do
  let(:journey) {JourneyLog.new}
  let(:oyster) {Oyster.new}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

describe "#initialize" do
  it 'starts with an empty number of journeys made' do
    expect(journey.journeys_made).to be_empty
  end
end

  describe "#entry_journey_details" do
    xit "saves the entry station and entry zone information" do
      oyster.touch_in(entry_station, 3)
      oyster.touch_out(exit_station, 4)
      journey = oyster.journeys_made.first
      expect(journey[:entry_station]).to eq(entry_station)
      expect(journey[:entry_zone]).to eq(3)
    end
  end

  describe "#exit_journeys_details" do
    xit "saves the exit station and exit zone information" do
       oyster.touch_in(entry_station, 3)
       oyster.touch_out(exit_station, 4)
       journey = oyster.journeys_made.first
       expect(journey[:exit_station]).to eq(exit_station)
       expect(journey[:exit_zone]).to eq(4)
    end
  end

  describe "#save_journey" do
    xit 'stores a journey in journeys_made' do
      oyster.touch_in(entry_station, 3)
      oyster.touch_out(exit_station, 3)
      expect(oyster.journeys_made.length).to eq 1
    end
  end

  describe "#in_journey?" do
    xit 'allows you to check if it is on a journey' do
      oyster.touch_in(entry_station, 3)
      oyster.touch_out(exit_station, 3)
      expect(oyster).not_to be_in_journey
    end
  end
end
