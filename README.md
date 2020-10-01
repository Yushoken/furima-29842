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
- has_one : buys

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | string | null: false |
| name   | string | null: false |
| info   | string | null: false |
| price  | string | null: false |

### Association

- belongs_to :users
- has_one : buys

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| token  | string     | null: false                    |

### Association

- has_one : users
- has_one : items
- has_one : buyers

## buyers テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | string     | null: false |
| city         | string     | null: false |
| addresses    | string     | null: false |
| phone_number | string     | null: false |

### Association

- has_one : buys