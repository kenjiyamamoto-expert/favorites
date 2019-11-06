# README

# Database設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|

### Association
- has_many :favorites

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|url|string|null: false|
|image|string|null: false|
|text|text|null: false|
|use_count|integer|-|

### Association
- belongs_to :user