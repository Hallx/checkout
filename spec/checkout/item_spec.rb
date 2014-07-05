require 'checkout'

describe Checkout::Item do
  let(:item_travel_card)  { Checkout::Item.new(001, 'Travel Card Holder', 9.25) }
  let(:item_watch)        { Checkout::Item.new(034, 'Round Faced Watch', 19.25) }

  describe "#==" do
    it "should return true if product_codes are same" do
      item_travel_card.product_code = item_watch.product_code = 040
      expect(item_travel_card).to eq(item_watch)
    end

    it "should return false if product_codes are not same" do
      duplicate_item              = item_watch.dup
      duplicate_item.product_code = 200

      expect(duplicate_item).not_to eq(item_watch)
    end
  end
end
