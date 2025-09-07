# spec/factories/order_addresses.rb
FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '渋谷区1-1' }
    building { 'ヒカリエ10F' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
