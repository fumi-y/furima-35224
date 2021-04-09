# テーブル設計


## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |


# Association
- has_many :comments
- has_many :items
- has_one :buy



## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| item_name        | string     | null: false |
| item_description | text       | null: false |
| condition_id     | integer    | null: false |
| postage_id       | integer    | null: false |
| area_id          | integer    | null: false |
| delivery_day_id  | integer    | null: false |
| price            | integer    | null: false |
| user_id          | references |             |


# Association
- has_many :comments
- belongs_to :user
- has_one :buy



## comments テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| text    | text       | null: false |
| user_id | references |             |
| item_id | references |             |


# Association
- belongs_to :user
- belongs_to :item



## buys テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | integer    | null: false |
| prefecture_id    | integer    | null: false |
| municipality     | string     | null: false |
| street_number    | string     | null: false |
| building_name    | string     |             |
| telephone_number | integer    | null: false |
| user_id          | references |             |
| item_id          | references |             |


# Association
- belongs_to :user
- belongs_to :item

