# Favorites

## 簡単な説明

Favoritesはお気に入りのサイトを登録し、カウント機能を用いることで自身の各サイトの使用頻度がわかるお気に入り管理サイトです。

## デモ

![](https://user-images.githubusercontent.com/52599034/70846482-1b017300-1e9d-11ea-92d9-d6541e5a35a1.gif)

## 機能
ログイン機能
お気に入りサイトの登録、編集、削除
お気に入りサイトの使用回数カウント機能

## 使い方
最初にユーザー情報を登録。
その後、お気に入りサイトの情報を登録し、初めて使用ができる。
デモで表示されているように、使用回数カウント使用後、リンク先へ遷移する。
お気に入りサイトは編集、削除ができる。
カテゴリー別に表示ができ、登録順、使用回数順などに並び替えも可能。

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
