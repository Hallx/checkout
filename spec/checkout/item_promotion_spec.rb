require 'checkout'

describe Checkout::ItemPromotion do
  let(:item_travel_card)  { Checkout::Item.new(001, 'Travel Card Holder', 9.25) }

  describe ".new" do
    it "should initialize with an item, quantity and new price" do
      expect { Checkout::ItemPromotion.new(item_travel_card, 2, 5) }.not_to raise_error
    end
  end
end
