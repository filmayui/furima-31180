FactoryBot.define do
  factory :item do
    association :user

    name { '長ぐつ' }
    price { '300' }
    text              { '雨の日に便利です' }
    category_id { '1' }
    sales_status_id { '1' }
    shopping_fee_status_id { '1' }
    prefecture_id { '1' }
    scheduled_delivery_id { '1' }
  end
end
