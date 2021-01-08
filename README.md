# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------              | ------ | ----------- |
| nickname              | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false | 
| first_name_kana       | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| encrypted_password    | string | null: false |
| barth                 | date   | null: false |

### Association

- has_many :items
- has_many :historys
- has_many :items thorough historys
- has_many :orders thorough historys

## items テーブル

| Column             | Type    | Options     |
| --------           | ------  | ----------- |
| name               | string  | null: false |
| info               | text    | null: false |
| category_id        | integer | null: false |
| status_id          | integer | null: false |
| ship_fee_id        | integer | null: false |
| ship_prefecture_id | integer | null: false |
| ship_date_id       | integer | null: false |
| price              | integer | null: false |
| barth              | integer | null: false |
| user               | references | foreign_key: true|

### Association

- has_one :order
- has_many :historys
- has_many :users thorough historys
- has_many :orders thorough historys


## orders テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| post_number     | string | null: false |
| prefecture      | string | null: false |
| city            | string | null: false |
| address         | string | null: false |
| building        | string |             |
| phone_number    | string | null: false |
| order           | references | foreign_key: true|

### Association

- belongs_to :item
- has_many historys 
- has_many :users thorough historys
- has_many :items thorough historys

## historys テーブル

| Column          | Type       | Options          |
| --------        | ------     | -----------      |
| user_id         | references | foreign_key: true|
| item_id         | references | foreign_key: true|
| order_id        | references | foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :order

