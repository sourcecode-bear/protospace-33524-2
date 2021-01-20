#テーブル設計

## users テーブル 

| column     | type   | options     |
|------------|--------|-------------|
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :prototype
- has_many :comment

## prototypes テーブル

| column     | type          | options           |
|------------|---------------|-------------------|
| title      | string        | null: false       |
| catch_copy | text          | null: false       |
| concept    | text          | null: false       |
| image      | ActiveStorage |                   |
| user       | references    | foreign_key: true |

### Association

- has_many :comments 
- belongs_to :user
- has_one_attached :image

## comments テーブル

|column    |type        |options            |
|----------|------------|-------------------|
|text      | text       | null: false       |
|user      | references | foreign_key: true |
|prototype | references | foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user