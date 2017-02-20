require 'station'

describe Station do
  let(:station) {Station.new}
  describe "#initialize" do
    it 'starts with a zone of nil' do
      expect(station.zone).to eq nil
    end
  end
end
