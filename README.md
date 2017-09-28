## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|text|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :messages
- has_many :groups, through:group_users
- has_many :group_users

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :users, through:group_users
- has_many :group_users
- has_many :messages


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|image|text|null: false|
|group_id|integer|null: false|
|user_id|integer|null: false|

### Association
- belongs_to :group
- belongs_to :user

## group_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|group_id|integer|null: false|

### Association
- belongs_to :group
- belongs_to :user
