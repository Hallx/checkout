module Checkout
  class Checkout
    def initialize(rules)
      @item_rules   = rules[:item] || []
      @total_rules  = rules[:total] || []
      @items        = []
    end

    def scan(item)
      @items << item
    end

    def total
      @item_rules.each(&:apply)

      total = @items.inject(BigDecimal("0")) {|sum, item| sum + item.price}
    end
  end
end
