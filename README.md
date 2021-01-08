# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| name      | string | null: false |
| name_kana | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| barth     | integer| null: false |

### Association

- has_many :items

## items テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| name            | string | null: false |
| item_info       | string | null: false |
| item_category   | string | null: false |
| item_status     | string | null: false |
| ship_fee        | string | null: false |
| ship_prefecture | string | null: false |
| ship_date       | string | null: false |
| price           | integer | null: false |
| barth           | integer | null: false |
| user            | references | foreign_key: true|

### Association

- has_one :order

## orders テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| card_number     | integer | null: false |
| expiration_date | integer | null: false |
| cvc             | integer | null: false |
| post_number     | string | null: false |
| prefecture      | string | null: false |
| city            | string   | null: false |
| address         | string | null: false |
| building        | string | null: false |
| phone_number    | integer | null: false |
| order           | references | foreign_key: true|

### Association

- belongs_to :item

