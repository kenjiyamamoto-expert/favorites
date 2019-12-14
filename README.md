# Favorites

## 簡単な説明

Favoritesはお気に入りのサイトを登録し、カウント機能を用いることで自身の各サイトの使用頻度がわかるお気に入り管理サイトです。

## デモ

![Demo]()

## 機能

## 必要要件

## 使い方



## Database設計

### usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|

#### Association
- has_many :favorites

### favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false,unique: true|
|url|string|null: false,unique: true|
|image|string|null: false|
|text|text|null: false|
|links_count|integer|-|
|category_id|integer|-|
#### Association
- belongs_to :user
- has_many :links, dependent: :destroy

### linksテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|-|
|favorite_id|integer|-|

#### Association
- belongs_to :user
- belongs_to :favorite, counter_cache: :links_count
