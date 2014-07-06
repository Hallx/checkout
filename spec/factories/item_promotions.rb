FactoryGirl.define do
  factory :item_promotion, class: 'Checkout::ItemPromotion' do
    item        { FactoryGirl.build :item }
    quantity    3
    new_price   "5"

    initialize_with { new(item, quantity, new_price) }

    trait :travel_card do
      quantity  2
      new_price "8.50"
    end

    factory :item_travel_card_promotion, traits: [:travel_card]
  end
end
