module Checkout
  class TotalPromotion

    # discount percent is passedd as an integer (10% -> 10)
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
