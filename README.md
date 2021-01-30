# テーブル設計


## users テーブル

| Column        | Type   | Options  |
| --------      | ------ | -------- |
| nickname      | string | NOT NULL |
| email         | string | NOT NULL |
| password      | string | NOT NULL |
| full_name     | string | NOT NULL |
| date_of_birth | string | NOT NULL |


### Association

- has_many :item
- has_many :shipping
- has_many :purchase


## items テーブル

| Column      | Type       | Options  |
| ------      | ------     | -------- |
| name        | string     | NOT NULL |
| explanation | text       | NOT NULL |
| price       | integer    | NOT NULL |


### Association

- belongs_to :user
- belongs_to :purchase
- belongs_to :shipping


## purchases テーブル

| Column  | Type       | Options  |
| ------  | ---------- | -------- |
| record  | text       | NOT NULL |
| buyer   | string     | NOT NULL |
| user    | references | -------- |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping


## shippings テーブル

| Column  | Type       | Options  |
| ------  | ---------- | -------- |
| address | text       | NOT NULL |
| user    | references | -------- |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase