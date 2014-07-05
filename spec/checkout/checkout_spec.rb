require 'checkout'

describe Checkout do
  let(:promotional_rules) { {} }

  describe '.new' do

    it "should initialize with promotional rules" do
      expect{ Checkout::Checkout.new(promotional_rules) }.not_to raise_error
    end
  end

end
