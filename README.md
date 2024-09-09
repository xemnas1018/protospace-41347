#テーブル設計

##usersテーブル

| Column             | Type        | Options                        |
|--------------------|-------------|--------------------------------|
| email              | string      | null: false, unique: true      |
| encrypted_password | string      | null: false                    |
| name               | string      | null: false                    |
| profile            | text        | null: false                    |
| occupation         | text        | null: false                    |
| position           | text        | null: false                    |

##アソシエーション

has_many :prototypes
has_many :comments


##prototypesテーブル

| Column             | Type        | Options                        |
|--------------------|-------------|--------------------------------|
| title              | string      | null: false                    |
| catch_copy         | text        | null: false                    |
| concept            | text        | null: false                    |
| user               | reference   | null: false, foreign_key: true |
| occupation         | text        | null: false                    |
| position           | text        | null: false                    |

##アソシエーション

belongs_to :user
has_many :comments


##commentsテーブル

| Column             | Type        | Options                        |
|--------------------|-------------|--------------------------------|
| content            | text        | null: false                    |
| prototype          | reference   | null: false, foreign_key: true |
| user               | reference   | null: false, foreign_key: true |

##アソシエーション

belongs_to :user
belongs_to :prototype

