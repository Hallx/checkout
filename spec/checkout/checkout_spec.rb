require 'checkout'

describe Checkout do
  it 'should return correct version string' do
    Checkout::Checkout.new
    expect(2 + 2).to eq(4)
  end
end
