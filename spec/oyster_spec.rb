require 'oyster'

describe Oyster do
  let(:oyster) {Oyster.new}
  it 'has no money on the card' do
    expect(oyster.amount_on_card).to eq 0
  end
end
