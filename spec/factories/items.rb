FactoryGirl.define do
  factory :item, class: 'Checkout::Item' do
    product_code
    name          'Travel Card Holder'
    price         "9.25"

    trait :watch do
      name         'Round Faced Watch'
      price        "19.25"
    end

    trait :cufflinks do
      name         'Personalised cufflinks'
      price        "45.00"
    end

    trait :tshirt do
      name         'Kids T-shirt'
      price        "19.95"
    end

    initialize_with { new(product_code, name, price) }

    factory :item_travel_card
    factory :item_watch,      traits: [:watch]
    factory :item_cufflinks,  traits: [:cufflinks]
    factory :item_tshirt,     traits: [:tshirt]
  end
end
