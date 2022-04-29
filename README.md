## usersテーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| encrypted_password  | string  | null: false               |
| email               | string  | null: false, unique: true |
| name                | string  | null: false               |
| name_kana           | string  | null: false               |
| birthday            | integer | null: false               |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | text       | null: false                    |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | string     | null: false                    |
| situation   | string     | null: false                    |
| load        | string     | null: false                    |
| area        | string     | null: false                    |
| days        | string     | null: false                    |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :shipping_address

## Shipping_Addressesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | integer    | null: false                    |
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| purchase_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase