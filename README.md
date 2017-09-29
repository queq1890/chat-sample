## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, add_index :users, :name|
|email|text|null: false, unique: true|

### Association
- has_many :messages
- has_many :groups, through:group_users
- has_many :group_users

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :users, through:group_users
- has_many :group_users
- has_many :messages


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|text||
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## group_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
