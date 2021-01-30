# テーブル設計


## users テーブル

| Column             | Type       | Options                  |
| ------             | ------     | --------                 |
| nickname           | string     | null: false              |
| email              | string     | null: false, unique: true|
| encrypted_password | string     | null: false              |
| last_name          | string     | null: false              |
| first_name         | string     | null: false              |
| last_name_frigana  | string     | null: false              |
| last_name_frigana  | string     | null: false              |
| date_of_birth      | date       | null: false              |
| user               | references | foreign_key: true        |


### Association

- has_many :purchase_managements


## items テーブル

| Column              | Type       | Options     |
| ------              | ------     | --------    |
| name                | string     | null: false |
| description         | text       | null: false |
| category_id         | integer    | null: false |
| condition_id        | integer    | null: false |
| shipping_charges_id | integer    | null: false |
| shipping_area_id    | integer    | null: false |
| day_to_ship_id      | integer    | null: false |
| price               | integer    | null: false |


### Association

- has_one    :purchase_management


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
| postal_code    | string     | null: false       |
| prefectures_id | integer    | null: false       |
| municipality   | text       | null: false       |
| address        | text       | null: false       |
| building_name  | text       | --------          |
| phone_number   | string     | null: false       |
| user           | references | foreign_key: true |



### Association

- belongs_to :purchase_management