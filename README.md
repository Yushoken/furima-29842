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

- has_many :item
- has_one : buy

## items テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| name                | text    | null: false |
| info                | text    | null: false |
| price               | integer | null: false |
| sales_status        | text    | null: false |
| shipping_fee_status | text    | null: false |
| prefecture          | text    | null: false |
| scheduled_delivery  | text    | null: false |
| category            | text    | null: false |


### Association

- belongs_to :user
- has_one : buy

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false                    |
| item   | references | null: false                    |

### Association

- has_one : user
- has_one : item
- has_one : address

## addresses テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| addresses    | string     | null: false |
| building     | string     | null: false |
| phone_number | string     | null: false |

### Association

- belongs_to : buy