# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |
| birth_day          | text   | null: false |


### Association

- has_many :items
- has_many :comments
- has_one :purchase

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| explanation     | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| sipping_area    | string     | null: false                    |
| days            | string     | null: false                    |
| category        | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :category
- has_one :purchase

## category テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| category  | string     | null: false                    |

### Association

- belongs_to :item

## purchase テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :sipping_address

## shipping_address テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| prefectures       | string     | null: false                    |
| municipalities    | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     | null: false                    |
| phone_number      | string     | null: false                    |

### Association

- belongs_to :purchase

## comment テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item