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
 
ririkusu

アプリ「ririksu」は、ユーザーが曲の歌詞に注釈や考察を投稿できるアプリケーションです。
 
# URL	
https://lyrics-annotation-app.herokuapp.com/
# テスト用アカウント
	ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。
# Usage	
ユーザーは検索機能からお好きな曲を検索していただくことで、元ネタとなったサンプリング曲やコラボアーティストとの関係性、制作のプロセスなどの考察や解説を通して音楽をより深く知ることができます。
解説や歌詞はユーザーが投稿・編集することができます。また、その曲及び注釈に対し、コメントすることができる欄を作りました。アーティスト及び、プロデューサーのマイページも用意されており、こちらもユーザーがバイオグラフィー、snsアカウントなどを編集していただけます。
お問い合わせフォームを通して、コメントや注釈の削除依頼を出すことができます。
# 目指した課題解決	
現状、好きな曲にまつわる情報をネットで調べると、個人のブログかキュレーターサイトばかりが検索結果に上がってくるため、量と質が担保されたまとまった情報を得ることができません。ウィキペディアのアーティストページでは、曲のリリース、ヒットチャート歴は出てきても、歌詞の解説は記述されていないことが主流です。
したがって、この課題を解決するために、曲の歌詞及び解説をユーザーが投稿・編集できるアプリケーションを作成しました。消費者が、コンテンツを議論していく機会が増えるとそのコンテンツはより成熟していきます。そのためのプラットフォームとなるようなアプリケーションが日本の音楽界にも必要だと考えています。
# 洗い出した要件	
スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。
# 実装した機能についてのGIFと説明	
実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。
# 実装予定の機能	
・コメントのいいね機能の非同期対応
・アーティストのフォロー機能と、フォロー一覧、いいねしたコメント一覧が確認できるユーザーマイページ
・歌詞の行数、または選択した範囲ごとの脚注投稿機能
# データベース設計	
ER図
https://app.lucidchart.com/publicSegments/view/5388e995-f649-4e36-9ba7-c80cfcf1581b
# ローカルでの動作方法	
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。

 
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
- has_many :sns_credentials
- has_many :comments
- has_many :favorites, dependent: :destroy


## songs テーブル

|       Column             |  Type      | Options                        |
| ------------------------ | ---------- | ------------------------------ |
|        name              |   string   | null: false                    |
|        youtube_url       |   string   | null: false                    |
|         text             |    text    | null: false                    |
|        translate         |  text      |                                |
|        genre_id          |   integer  | null: false                    |
|         sales_date       |  datetime  | null: false                    |
|        producer          | references | null: false, foreign_key: true |
|         featuring        | references | null: false, foreign_key: true |
|         user             | references | null: false, foreign_key: true |


### Association
- belongs_to_active_hash :genre
- belongs_to :producer, optional: true
- belongs_to :featuring, optional: true
- belongs_to :user
- has_many :annotates
- has_many :comments
- has_many :artists through song_artist_relations, dependent: :destroy
- has_many :song_artist_relations
- has_one_attached :image
- has_one :annotation


 
## artists テーブル

|     Column       |  Type      |            Options             |
| ---------------- | ---------- | -------------------------------|
|      art_name    | string     | null: false                    |
### Association 

- has_many :songs through song_artist_relations
- has_many :song_artist_relations
- has_one :artist_profile


## song_artist_relations テーブル

|     Column       |  Type      |            Options             |
| ---------------- | ---------- | -------------------------------|
|       song       | references | null: false, foreign_key: true |
|       user       | references | null: false, foreign_key: true |
### Association 
- belongs_to :song
- belongs_to :user

## annotations テーブル

|     Column     |  Type      |            Options             |
| -------------- | ---------- | -------------------------------|
|     album      | string     |                                |
|     sample     | string     |                                |
|    message     | text       |                                |
|     trouble    | text       |                                |
|   intention    | text       | null: false                    |
|      slang     | text       |                                |
|      info      | text       |                                |
|      award     | text       |                                |
| relationship   | text       |                                |
|    image_text  | text       |                                |
|       song     | references | null: false, foreign_key: true |

### Association
- belongs_to :song
- has_one_attached :image

## comments テーブル

|     Column       |  Type      |            Options             |
| ---------------- | ---------- | -------------------------------|
|      text        | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| song             | references | null: false, foreign_key: true |

### Association
- has_many :favorites, dependent: :destroy
- belongs_to :user
- belongs_to :song

## feturings テーブル

|     Column       |  Type      |            Options             |
| ---------------- | ---------- | -------------------------------|
| featuring_name   | string     | null: false                    |

### Association
- has_many :songs

## producers テーブル

|     Column       |  Type      |            Options             |
| ---------------- | ---------- | -------------------------------|
|  producer_name   | text       | null: false                    |

### Association
- has_many :songs


## artist_profiles テーブル

|     Column       |  Type      |            Options             |
| ---------------- | ---------- | -------------------------------|
|      biography   | text       |                                |
|      insta       | string     |                                |
|      twitter     |  string    |                                |
| artist           | references | null: false, foreign_key: true |

### Association
 - belongs_to :artist
 - has_one_attached :image

## producer_profiles テーブル

|     Column       |  Type      |            Options             |
| ---------------- | ---------- | -------------------------------|
|      biography   | text       |                                |
|      insta       | string     |                                |
|      twitter     | string     |                                |
|   producer       | references | null: false, foreign_key: true |

### Association
 - belongs_to :producer
 - has_one_attached :image


 ## favorites テーブル

|     Column       |  Type      |            Options             |
| ---------------- | ---------- | -------------------------------|
| user             | references |              foreign_key: true |
|   comment        | references | null: false, foreign_key: true |

### Association
- belongs_to :user 
- belongs_to :comment



# sns_credentials テーブル

| Column           | Type     | Option                         |
| -------------- | ---------- | ------------------------------ |
| provider       |   string   |                                |
| uid            |   string   |                                |
| user           | references |              foreign_key: true |
### Association

- belongs_to :user, optional: true