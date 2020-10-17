# テーブル設計

## users テーブル

| Column                | Type      | Options     |
| --------------------- | --------- | ----------- |
| nickname              | string    | null: false |
| password              | string    | null: false |
| email                 | string    | null: false |
| last_name             | string    | null: false |
| first_name            | string    | null: false |
| last_name_kana        | string    | null: false |
| first_name_kana       | string    | null: false |
| user_birth_date_year  | integer   | null: false |
| user_birth_date_month | integer   | null: false |
| user_birth_date_day   | integer   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| price                  | integer    | null: false                    |
| text                   | text       | null: false                    |
| buyable                | boolean    | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shopping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :sales_status
- belongs_to_active_hash :shopping_fee_statue
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :scheduled_delivery

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to_active_hash :prefecture
