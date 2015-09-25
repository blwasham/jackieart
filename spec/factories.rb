# This will guess the User class
FactoryGirl.define do
  factory :painting do
    name "Really Awesome Painting"
    description "This is a really awesome painting"
    price_cents 100.00
    image_name "really_awesome.jpg"
  end
end
