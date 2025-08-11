# テーブル設計
## users テーブル

| Column             | Type        | Options                   |
|----------------    |-------------|---------------------------|
| nickname           | string(30)  | null: false               |
| email              | string(255) | null: false, unique: true |
| encrypted_password | string(255) | null: false               |
| last_name          | string(20)  | null: false               |
| first_name         | string(20)  | null: false               |
| last_name_kana     | string(40)  | null: false               |
| first_name_kana    | string(40)  | null: false               |
| birth_date         | date        | null: false               |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column       | Type         | Options                        |
|--------------|--------------|--------------------------------|
| name         | string(40)   | null: false                    |
| description  | text         | null: false                    |
| category_id  | integer      | null: false                    |
| condition_id | integer      | null: false                    |
| user         | references   | null: false, foreign_key: true |
| price        | integer      | null: false                    |


### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type   | Options                        |
|---------|--------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| item    | bigint     | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type        | Options                        |
|---------------|-------------|--------------------------------|
| order         | bigint      | null: false, foreign_key: true |
| postal_code   | string(10)  | null: false                    |
| prefecture_id | integer     | null: false                    |
| city          | string(50)  | null: false                    |
| street        | string(50)  | null: false                    |
| building      | string(50)  |                                |
| phone_number  | string(15)  | null: false                    |

### Association
- belongs_to :order
