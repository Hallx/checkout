FactoryGirl.define do
  factory :total_promotion, class: 'Checkout::TotalPromotion' do
    amount    "60"
    discount  10

    initialize_with { new(amount, discount) }
  end
end
