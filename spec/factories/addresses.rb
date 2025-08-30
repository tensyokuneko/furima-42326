FactoryBot.define do
  factory :address do
    order { nil }
    postal_code { "MyString" }
    prefecture_id { 1 }
    city { "MyString" }
    street { "MyString" }
    building { "MyString" }
    phone_number { "MyString" }
  end
end
