# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------              | ------ | ----------- |
| nickname              | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false | 
| first_name_kana       | string | null: false |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false |
| birth                 | date   | null: false |

### Association

- has_many :items
- has_many :histories
- has_many :comments

## items テーブル

| Column             | Type    | Options     |
| --------           | ------  | ----------- |
| name               | string  | null: false |
| info               | text    | null: false |
| category_id        | integer | null: false |
| status_id          | integer | null: false |
| ship_fee_id        | integer | null: false |
| prefecture_id      | integer | null: false |
| ship_date_id       | integer | null: false |
| price              | integer | null: false |
| user               | references | foreign_key: true|

### Association

- belongs_to :user
- has_one :history
- has_many :comments

## orders テーブル

| Column          | Type    | Options     |
| --------        | ------  | ----------- |
| post_number     | string  | null: false |
| prefecture_id   | integer | null: false |
| city            | string  | null: false |
| address         | string  | null: false |
| building        | string  |             |
| phone_number    | string  | null: false |
| history         | references | foreign_key: true|

### Association

- belongs_to history 

## histories テーブル

| Column          | Type       | Options          |
| --------        | ------     | -----------      |
| user            | references | foreign_key: true|
| item            | references | foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :order

## comments テーブル

| Column          | Type       | Options          |
| --------        | ------     | -----------      |
| comment         | text       | null: false      |
| user            | references | foreign_key: true|
| item            | references | foreign_key: true|

belongs_to :user
belongs_to :item
