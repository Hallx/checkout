module Checkout
  class TotalPromotion < Promotion

    # discount percent as integer (10% -> 10)
    def initialize(amount, discount)
      @amount   = amount
      @discount = discount
    end

    def apply(total)
      puts "amount is smaller: #{total >= @amount}"
      if total >= @amount
        r = (1.0-(@discount/100.0)) * total
        puts "amount #{r}"
        puts ""
      else
        puts "total"
        total
      end
    end
  end
end
