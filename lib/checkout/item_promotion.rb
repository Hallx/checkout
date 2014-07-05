module Checkout
  class ItemPromotion < Promotion

    def initialize(item, quantity, new_price)
      @item = item
      @quantity = quantity
    end
  end
end
