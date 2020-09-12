# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Name
 
annotation 

アプリ「annotation」は、曲の歌詞に注釈を投稿できるアプリケーションです。
 

# URL	
デプロイ済みのURLを記述しましょう。デプロイが済んでいない場合は、デプロイ次第記述しましょう。
# テスト用アカウント
	ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。
# 利用方法	
このアプリケーションの利用方法を説明しましょう。
# 目指した課題解決	
このアプリケーションを通じて、どのような人の、どのような課題を解決したかったかを書きましょう。
# 洗い出した要件	
スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。
# 実装した機能についてのGIFと説明	
実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。
# 実装予定の機能	
洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。
# データベース設計	
ER図等を添付しましょう。
# ローカルでの動作方法	
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。
# DEMO
 
"hoge"の魅力が直感的に伝えわるデモ動画や図解を載せる
 
# Features
 
"hoge"のセールスポイントや差別化などを説明する
 
# Requirement
 
"hoge"を動かすのに必要なライブラリなどを列挙する
 
* huga 3.5.2
* hogehuga 1.0.2
 
# Installation
 
Requirementで列挙したライブラリなどのインストール方法を説明する
 
```bash
pip install huga_package
```
 
# Usage
 
DEMOの実行方法など、"hoge"の基本的な使い方を説明する
 
```bash
git clone https://github.com/hoge/~
cd examples
python demo.py
```
 
# Note
 
注意点などがあれば書く
 
# Author
 
作成情報を列挙する
 
* 作成者
* 所属
* E-mail
 
# License
ライセンスを明示する
 
"hoge" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).
 
社内向けなら社外秘であることを明示してる
 
"hoge" is Confidential.

## users テーブル
|     Column       |  Type    |   Options   |
| ---------------- | -------- | ----------- |
|      email       | string   | null: false |
|encrypted_password| string   | null: false |
|    nickname      | string   | null: false |

### Association
- has_many :songs
- has_many :annotates
- has_one :profile
- has_many :sns_credentials
- has_many :comments

## songs テーブル

|       Column             |  Type      | Options                        |
| ------------------------ | ---------- | ------------------------------ |
|        name              |   string   | null: false                    |
|        youtube_url       |   string   | null: false                    |
|         text             |    text    | null: false                    |
|        translate         |  text      | null: false                    |
|        genre_id          |   integer  | null: false                    |
|        artist            | references | null: false, foreign_key: true |
|         user             | references | null: false, foreign_key: true |

### Association

- has_many :annotates
- belongs_to :user
- has_many :artists through song_artist_relations
- has_many :song_artist_relations
- has_one_attached :image
- belongs_to_active_hash :genre

## annotates テーブル
|     Column       |  Type      |            Options             |
| ---------------- | ---------- | -------------------------------|
|      text        | text       | null: false                    |
|       song       | references | null: false, foreign_key: true |
|    user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :song
- has_many :comments

## artists テーブル
|     Column       |  Type      |            Options             |
| ---------------- | ---------- | -------------------------------|
|      name        | string     | null: false                    |
|      image       | string     | null: false                    |

### Association

- has_many :songs through song_artist_relations
- has_many :song_artist_relations

## comments テーブル
|     Column       |  Type      |            Options             |
| ---------------- | ---------- | -------------------------------|
|      text        | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| annotate         | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :annotate

## profiles テーブル
|     Column       |  Type      |            Options             |
| ---------------- | ---------- | -------------------------------|
|      text        | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
### Association

- belongs_to :user

# sns_credentials テーブル

| Column           | Type     | Option                         |
| -------------- | ---------- | ------------------------------ |
| provider       |   string   |                                |
| uid            |   string   |                                |
| user           | references | null: false, foreign_key: true |
### Association

- belongs_to :user