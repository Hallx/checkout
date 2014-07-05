module Checkout
  class TotalPromotion < Promotion

    # discount percent as integer (10% -> 10)
    def initialize(amount, discount)
      @amount   = BigDecimal.new(amount)
      @discount = discount
    end

    def apply(total)
      if total >= @amount
        (1.0-(@discount/100.0)) * total
      else
        total
      end
    end
  end
end
