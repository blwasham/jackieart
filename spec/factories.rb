FactoryGirl.define do
  factory :category do
    name "MyString"
    description "MyString"
  end

  factory :painting do
    association :categories, factory: :category
    sequence(:name) { |n| "painting#{n}" }
    description "This is a really awesome painting"
    price_cents 100.00
    sequence(:image_name) { |n| "image#{n}.jpg" }
    
    factory :paintings_with_categories do
      transient do
        categories_count 5
      end
      
      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |painting, evaluator|
        create_list(:category, evaluator.categories_count, painting: painting)
      end
    end
  end
end
