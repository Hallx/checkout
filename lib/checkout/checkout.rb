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
      apply_item_rules

      total = apply_total_rules(total_price)
      total.round(2)
    end

    private

    def total_price
      @items.inject(BigDecimal("0")) {|sum, item| sum + item.price}
    end

    def apply_item_rules
      @item_rules.each {|rule| rule.apply(@items) }
    end

    def apply_total_rules(total)
      @total_rules.inject(total) {|total, rule| rule.apply(total) }
    end
  end
end
