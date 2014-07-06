require 'checkout'

describe Checkout::ItemPromotion do
  let(:item_travel_card)  { FactoryGirl.build(:item_travel_card) }
  let(:item_watch)        { FactoryGirl.build(:item_watch) }

  describe ".new" do
    it "should initialize with an item, quantity and new price" do
      expect { FactoryGirl.build(:item_promotion) }.not_to raise_error
    end
  end

  describe "#apply" do
    let(:item_promotion) { FactoryGirl.build(:item_promotion, item: item_travel_card) }

    context "promotion rules are applicable" do
      let(:items) { [item_travel_card, item_travel_card, item_watch, item_travel_card ] }

      it "should change the prices only for applicable items" do
        item_promotion.apply(items)

        expect(items[0].price).to eq(5)
        expect(items[1].price).to eq(5)
        expect(items[3].price).to eq(5)

        # 3rd item should retain its price
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
