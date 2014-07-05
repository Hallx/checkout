module Checkout
  class Promotion

    def apply
      raise "Abstract class method called: Implement me in subclass"
    end

    private

    def filter_items(items)
      items.select { |item| @item == item }
    end
  end
end
