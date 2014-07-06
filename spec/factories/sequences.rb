FactoryGirl.define do
  sequence :product_code do |n|
    n.to_s.rjust(3, "0")
  end
end
