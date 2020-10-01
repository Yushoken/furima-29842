# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| birth_date     | string | null: false |
| first_name     | string | null: false |
| last_name      | string | null: false |
| first_name_kana| string | null: false |
| last_name_kana | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | text       | null: false |
| info                | text       | null: false |
| price               | integer    | null: false |
| sales_status        | integer    | null: false |
| shipping_fee_status | integer    | null: false |
| prefecture          | integer    | null: false |
| scheduled_delivery  | integer    | null: false |
| category            | integer    | null: false |
| user                | references | null: false                    |


### Association

- belongs_to :user
- has_one : buy

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false                    |
| item   | references | null: false                    |

### Association

- belongs_to : user
- belongs_to : item
- has_one : address

## addresses テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | string     | null: false |
| prefecture   | integer    | null: false |
| city         | string     | null: false |
| addresses    | string     | null: false |
| building     | string     |             |
| phone_number | string     | null: false |

### Association

- belongs_to : buy