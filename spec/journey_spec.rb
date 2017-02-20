require 'journey'
require 'oyster'

describe Journey do
  let(:journey) {Journey.new}
  let(:oyster) {Oyster.new(journey)}

  it 'has a start station that defaults to nil' do
    expect(journey.entry_station).to eq nil
  end

  it 'has an end station that defaults to nil' do
    expect(journey.exit_station).to eq nil
  end
end
