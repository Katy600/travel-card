require 'oyster'

describe Oyster do
  let(:oyster) {Oyster.new}
  it 'has no money on the card' do
    expect(oyster.balance).to eq 5
  end
describe "#top_up" do

  it { is_expected.to respond_to(:top_up).with(1).argument }

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
  describe "#deduct" do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts an amount from the total balance' do
      expect {oyster.deduct(3)}.to change {oyster.balance}.by(-3)
    end
  end

  describe "#touch_in" do
    it 'knows that it is on a journey when it touches in' do
      oyster.touch_in
      expect(oyster.in_use).to eq true
    end
  end

end
