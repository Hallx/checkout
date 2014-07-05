module Checkout
  class ItemPromotion < Promotion

    def initialize(item, quantity, new_price)
      @item      = item
      @quantity  = quantity
      @new_price = new_price
    end

    def apply(items)
      applicable_items = filter_items(items)

      if applicable_items.size >= @quantity
        applicable_items.each { |item| item.price = @new_price }
      end
    end

    private

    def filter_items(items)
      items.select { |item| @item == item }
    end
  end
end
