module Checkout
  class Item
    attr_accessor :product_code, :name, :price

    def initialize(product_code, name, price)
      @product_code = product_code
      @name         = name
      @price        = BigDecimal.new(price)
    end

    def ==(item)
      @product_code == item.product_code
    end
  end
end
