FactoryGirl.define do
  factory :painting do
    sequence(:name) { |n| "painting#{n}" }
    description "This is a really awesome painting"
    price_cents 100.00
    sequence(:image_name) { |n| "image#{n}.jpg" }
  end
end
