FactoryGirl.define do
  factory :item_promotion, class: 'Checkout::ItemPromotion' do
    item        { FactoryGirl.build :item }
    quantity    3
    new_price   "5"

    initialize_with { new(item, quantity, new_price) }

    trait :card_holder do
      quantity  2
      new_price "8.50"
    end

    factory :item_card_holder_promotion, traits: [:card_holder]
  end
end
