FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price(as_string: true) }
    stock { Faker::Number.number }
  end
end
