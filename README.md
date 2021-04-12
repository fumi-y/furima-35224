# テーブル設計


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

# Association
<!-- - has_many :comments -->
- has_many :items, dependent: :destroy
- has_many :buys, dependent: :destroy



## items テーブル

| Column          | Type       | Options            |
| --------------- | ---------- | ------------------ |
| name            | string     | null: false        |
| description     | text       | null: false        |
| condition_id    | integer    | null: false        |
| postage_id      | integer    | null: false        |
| area_id         | integer    | null: false        |
| delivery_day_id | integer    | null: false        |
| category_id     | integer    | null: false        |
| price           | integer    | null: false        |
| user            | references | foreign_key: true  |


# Association
<!-- - has_many :comments -->
- belongs_to :user
- has_one :buys, dependent: :destroy



<!-- ## comments テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| text    | text       | null: false |
| user_id | references |             |
| item_id | references |             |


# Association
- belongs_to :user
- belongs_to :item -->



## buys テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| prefecture_id    | integer    | null: false       |
| municipality     | string     | null: false       |
| street_number    | string     | null: false       |
| building_name    | string     |                   |
| telephone_number | string     | null: false       |
| buying_history   | references | foreign_key: true |

# Association
- has_one :buying_history, dependent: :destroy
- belongs_to :item
- belongs_to :user



## buying_historys テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

# Association
- belongs_to :buy