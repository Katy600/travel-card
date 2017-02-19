require 'oyster'

describe Oyster do
  let(:oyster) {Oyster.new}
  it 'has no money on the card' do
    expect(oyster.amount_on_card).to eq 5
  end
describe "#top_up" do
  it 'can be topped up' do
    oyster.top_up(5)
    expect(oyster.amount_on_card).to eq 10
  end
end

end
