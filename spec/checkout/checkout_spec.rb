require 'checkout'

describe Checkout do
  let(:promotional_rules) { {} }

  describe '.new' do

    it "should initialize with promotional rules" do
      expect { Checkout::Checkout.new(promotional_rules) }.not_to raise_error
    end
  end

  describe '#scan' do
    let!(:subject) { Checkout::Checkout.new(promotional_rules) }
    let(:item) { Checkout::Item.new }

    it "should add an item to scanned list" do
      expect { subject.scan(item) }.to change { subject.items }
    end
  end
end
