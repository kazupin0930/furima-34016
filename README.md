# テーブル設計


## users テーブル

| Column                  | Type   | Options             |
| --------                | ------ | --------            |
| nickname                | string | NOT NULL            |
| email                   | string | NOT NULL, NOT UNIQUE|
| encrypted_password      | string | NOT NULL            |
| last_name               | string | NOT NULL            |
| first_name              | string | NOT NULL            |
| last_name_frigana       | string | NOT NULL            |
| last_name_frigana       | string | NOT NULL            |
| date_of_birth           | date   | NOT NULL            |


### Association

- has_many :items
- has_many :purchase_managements


## items テーブル

| Column              | Type    | Options  |
| ------              | ------  | -------- |
| name                | string  | NOT NULL |
| description         | text    | NOT NULL |
| category_id         | integer | NOT NULL |
| condition_id        | integer | NOT NULL |
| shipping_charges_id | integer | NOT NULL |
| shipping_area_id    | integer | NOT NULL |
| day_to_ship_id      | integer | NOT NULL |
| price               | integer | NOT NULL |
| who_bought_it       | string  | NOT NULL |


### Association

- belongs_to :user
- belongs_to :purchase_management


## purchase_managements テーブル

| Column      | Type       | Options           |
| ------      | ---------- | --------          |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address


## shipping_addresses テーブル

| Column         | Type       | Options           |
| ------         | ---------- | --------          |
| postal_code    | integer    | NOT NULL          |
| prefectures_id | integer    | NOT NULL          |
| municipality   | text       | NOT NULL          |
| address        | text       | NOT NULL          |
| building_name  | text       | --------          |
| phone_number   | string     | NOT NULL          |
| who_listed     | string     | NOT NULL          |
| user           | references | foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase_management