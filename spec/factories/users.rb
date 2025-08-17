FactoryBot.define do
  factory :user do
    nickname              { "テスト太郎" }
    email                 { Faker::Internet.unique.email }
    password              { "abc123" }
    password_confirmation { "abc123" }
    last_name             { "山田" }
    first_name            { "太郎" }
    last_name_kana        { "ヤマダ" }
    first_name_kana       { "タロウ" }
    birth_date            { "2000-01-01" }
  end
end

