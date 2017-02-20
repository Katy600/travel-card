require 'journey'
require 'oyster'

describe Journey do
  let(:journey) {Journey.new}
  let(:oyster) {Oyster.new(journey)}
  
  describe "#initialize" do
    it 'has a start station that defaults to nil' do
      expect(journey.entry_station).to eq nil
    end

    it 'has an end station that defaults to nil' do
      expect(journey.exit_station).to eq nil
    end

    it 'has an entry_zone that defaults to 0' do
      expect(journey.entry_zone).to eq 0
    end

    it 'has an exit_zone that defaults to 0' do
      expect(journey.exit_zone).to eq 0
    end
  end
end
