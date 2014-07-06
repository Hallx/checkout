require 'checkout'

describe Checkout do
  let(:promotional_rules) { {} }
  let(:item_travel_card)  { FactoryGirl.build(:item) }
  let(:item_cufflinks)    { FactoryGirl.build(:item_cufflinks) }

  describe '.new' do
    it "should initialize with promotional rules" do
      expect { Checkout::Checkout.new(promotional_rules) }.not_to raise_error
    end
  end

  describe '#scan' do
    let!(:checkout) { Checkout::Checkout.new(promotional_rules) }

    it "should change total" do
      expect{ checkout.scan(item_travel_card) }.to change{ checkout.total }
    end
  end

  describe '#total' do
    let!(:checkout) { Checkout::Checkout.new(promotional_rules) }

    context "when no items" do
      it "should return 0" do
        expect(checkout.total).to eq(0)
      end
    end

    context "when items have been scanned" do
      before do
        checkout.scan item_cufflinks
        checkout.scan item_travel_card
      end

      it "should return total amount" do
        expect(checkout.total).to eq(54.25)
      end
    end
  end
end
