FactoryGirl.define do
  factory :item_promotion, class: 'Checkout::ItemPromotion' do
    item        { FactoryGirl.build :item }
    quantity    3
    new_price   "5"

    initialize_with { new(item, quantity, new_price) }
  end
end
