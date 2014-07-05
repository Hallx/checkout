module Checkout
  class Checkout
    attr_reader :items

    def initialize(rules)
      @rules = rules
      @items = []
    end

    def scan(item)
      items << item
    end

    def total
      items.inject(0) {|sum, item| sum + item.price}
    end
  end
end
