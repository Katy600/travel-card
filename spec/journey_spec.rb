require 'journey'

describe Journey do
  let(:journey) {Journey.new}
  it 'has a start station that defaults to nil' do
    expect(journey.start_station).to eq nil
  end
  it 'has an end station that defaults to nil' do
    expect(journey.end_station).to eq nil
  end
end
