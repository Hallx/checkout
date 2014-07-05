require 'checkout'

describe Checkout::ItemPromotion do
  let(:item_travel_card)  { Checkout::Item.new(001, 'Travel Card Holder', 9.25) }
  let(:item_watch)        { Checkout::Item.new(034, 'Round Faced Watch', 19.25) }

  describe ".new" do
    it "should initialize with an item, quantity and new price" do
      expect { Checkout::ItemPromotion.new(item_travel_card, 2, 5) }.not_to raise_error
    end
  end

  describe "#apply" do
    let(:item_promotion)  { Checkout::ItemPromotion.new(item_travel_card, 3, 5) }

    context "promotion rules are applicable" do
      let(:items) { [item_travel_card, item_travel_card, item_watch, item_travel_card ] }

      it "should change the prices only for applicable items" do
        item_promotion.apply(items)

        expect(items[0].price).to eq(5)
        expect(items[1].price).to eq(5)
        expect(items[3].price).to eq(5)
        #3rd item should retain its price
        expect(items[2].price).to eq(19.25)
      end
    end

    context "promotion rules are not applicable" do
      let(:items) { [item_travel_card, item_travel_card, item_watch ] }

      it "should not change the prices when items are less than quantity required to apply promotion" do
        item_promotion.apply(items)

        # no change in price
        expect(items[0].price).to eq(9.25)
        expect(items[1].price).to eq(9.25)
        expect(items[2].price).to eq(19.25)
      end
    end
  end
end
