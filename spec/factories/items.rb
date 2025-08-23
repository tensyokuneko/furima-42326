FactoryBot.define do
  factory :item do
    name              { 'テスト商品' }
    description       { 'これはテスト用の商品です' }
    category_id       { 2 }
    condition_id      { 2 }
    shipping_fee_id   { 2 }
    prefecture_id     { 2 }
    shipping_days_id  { 2 }
    price             { 1000 }

    # 出品者（Userモデル）との関連付け
    association :user

    # ActiveStorage 画像を添付
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec/fixtures/files/test_image.png')), filename: 'test_image.png')
    end
  end
end
