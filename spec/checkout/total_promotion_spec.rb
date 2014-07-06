describe Checkout::TotalPromotion do
  describe ".new" do
    it "should initialize with an amount and discount" do
      expect { Checkout::TotalPromotion.new("20", 5) }.not_to raise_error
    end
  end

  describe "#apply" do
    let(:total_promotion) { Checkout::TotalPromotion.new(20, 5) }

    context "promotion rules are applicable" do
      it "should change return total after applying discount" do
        expect(total_promotion.apply(BigDecimal.new(30))).to eq(28.5)
      end
    end

    context "promotion rules are not applicable" do
      it "should not change the total" do
        expect(total_promotion.apply(BigDecimal.new(10))).to eq(10)
      end
    end
  end
end
