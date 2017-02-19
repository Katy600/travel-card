require 'oyster'

describe Oyster do
  let(:oyster) {Oyster.new}
  it 'has no money on the card' do
    expect(oyster.amount_on_card).to eq 5
  end
describe "#top_up" do

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can be topped up' do
    oyster.top_up(5)
    expect(oyster.amount_on_card).to eq 10
  end

  it 'can top up the balance' do
    expect{ oyster.top_up 1 }.to change{ oyster.amount_on_card }.by 1
  end

end
describe "#maximum_amount" do
  it 'prevents you from topping up over 90 pounds' do
    expect(oyster.top_up(100)).to eq "You have reached your maximum amount"
  end
end

end
