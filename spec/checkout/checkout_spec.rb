require 'checkout'

describe Checkout do
  let(:promotional_rules) { {} }
  let(:item_travel_card)  { Checkout::Item.new(001, 'Travel Card Holder', 9.25) }
  let(:item_cufflinks)    { Checkout::Item.new(002, 'Personalised cufflinks ', 45.00) }

  describe '.new' do
    it "should initialize with promotional rules" do
      expect { Checkout::Checkout.new(promotional_rules) }.not_to raise_error
    end
  end

  describe '#scan' do
    let!(:checkout) { Checkout::Checkout.new(promotional_rules) }

    it "should add an item to scanned list" do
      expect { checkout.scan(item_travel_card) }.to change { checkout.items }
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
