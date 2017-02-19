require 'journey'
require 'oyster'

describe Journey do
  let(:journey) {Journey.new}
  let(:oyster) {Oyster.new(journey)}

  it 'has a start station that defaults to nil' do
    expect(journey.start_station).to eq nil
  end

  it 'has an end station that defaults to nil' do
    expect(journey.end_station).to eq nil
  end

  it 'records the start journey' do
    oyster.touch_in("Holborn")
    expect(journey.start_station).to eq "Holborn"
  end
end
