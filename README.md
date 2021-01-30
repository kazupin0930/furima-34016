# テーブル設計


## users テーブル

| Column                  | Type   | Options  |
| --------                | ------ | -------- |
| nickname                | string | NOT NULL |
| email                   | string | NOT NULL |
| encrypted_password      | string | NOT NULL |
| last_name               | string | NOT NULL |
| first_name              | string | NOT NULL |
| last_name_Frigana       | string | NOT NULL |
| last_name_Frigana       | string | NOT NULL |
| date_of_birth           | date   | NOT NULL |


### Association

- has_many :items
- has_many :shipping_addresses
- has_many :purchase_managements


## items テーブル

| Column           | Type    | Options  |
| ------           | ------  | -------- |
| name             | string  | NOT NULL |
| description      | text    | NOT NULL |
| category         | string  | NOT NULL |
| condition        | string  | NOT NULL |
| shipping_charges | string  | NOT NULL |
| shipping_area    | string  | NOT NULL |
| day_to_ship      | string  | NOT NULL |
| price            | integer | NOT NULL |


### Association

- belongs_to :user
- belongs_to :purchase_management
- belongs_to :shipping_address


## purchase_managements テーブル

| Column        | Type       | Options  |
| ------        | ---------- | -------- |
| who_bought_it | string     | NOT NULL |
| user          | references | -------- |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping


## shipping_addresses テーブル

| Column  | Type          | Options  |
| ------  | ----------    | -------- |
| who_listed | string     | NOT NULL |
| address    | text       | NOT NULL |
| user       | references | -------- |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase