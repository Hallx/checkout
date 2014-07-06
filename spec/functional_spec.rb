require 'checkout'

describe Checkout do
  let(:item_travel_card)  { FactoryGirl.build(:item) }
  let(:item_cufflinks)    { FactoryGirl.build(:item_cufflinks) }
  let(:item_tshirt)       { FactoryGirl.build(:item_tshirt) }

  let(:item_promotion)    { FactoryGirl.build(:item_card_holder_promotion, item: item_travel_card) }
  let(:total_promotion)   { Checkout::TotalPromotion.new("60", 10) }
  let(:promotional_rules) { { total: [ total_promotion ], item: [ item_promotion ] } }

  let(:checkout)          { Checkout::Checkout.new(promotional_rules) }

  describe "promotional_rules" do
    context "total promotion" do
      it "should lower the total" do
        checkout.scan item_travel_card
        checkout.scan item_cufflinks
        checkout.scan item_tshirt

        expect( checkout.total ).to eq(66.78)
      end
    end

    context "item promotion" do
      it "should lower the individual price of item" do
        checkout.scan item_travel_card
        checkout.scan item_tshirt
        checkout.scan item_travel_card

        expect( checkout.total ).to eq(36.95)
      end
    end

    context "total and item promotion" do
      it "should lower the individual price of item as well as should lower the total" do
        checkout.scan item_travel_card
        checkout.scan item_cufflinks
        checkout.scan item_travel_card
        checkout.scan item_tshirt

        expect( checkout.total ).to eq(73.76)
      end
    end
  end
end
