FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    name { "tomato" }
    info {'あああ'}
    category_id {2}
    sales_status_id {0}
    shipping_fee_status_id {0}
    prefecture_id {0}
    scheduled_delivery_id {0}
    price {1000}
    association :user 
  end
end
