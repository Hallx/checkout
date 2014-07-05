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

  end
end
