FactoryBot.define do
  factory :user_order do
    postal_code              { '000-0000' }
    prefecture_id                 { 1 }
    city              { '名古屋' }
    addresses { '天空町' }
    building             { 'タワー' }
    phone_number            { '00000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
