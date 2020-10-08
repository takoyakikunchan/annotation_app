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
	Basic認証 
	ID : admin
	Pass : 2222

	テスト用アカウント
	メールアドレス :ririkusu@gmail.com
	パスワード :ririkusu00
# Usage	
ユーザーは検索機能からお好きな曲を検索していただくことで、サンプリング曲やコラボアーティストとの関係性、制作のプロセスなどの考察や解説を通して音楽をより深く知ることができます。
解説や歌詞はユーザーが投稿・編集することができます。また、その曲及び注釈に対し、コメントすることができる欄を作りました。アーティスト及び、プロデューサーのマイページも用意されており、こちらもユーザーがバイオグラフィー、snsアカウントなどを編集していただけます。
お問い合わせフォームを通して、コメントや注釈の削除依頼を出すことができます。
# 目指した課題解決	
１情報収集の効率化
現状、好きな曲にまつわる情報をネットで調べると、個人のブログかキュレーターサイトばかりが検索結果に上がってくるため、量と質が担保されたまとまった情報を得ることができません。ウィキペディアのアーティストページでは、曲のリリース、ヒットチャート歴は出てきても、歌詞の解説は記述されていないことが主流です。
したがって、この課題を解決するために、曲の歌詞及解説をユーザーが投稿・編集できるアプリケーションを作成しました。
2 音楽シーンの活性化
特に現在、日本、アメリカ、韓国のプロデューサーに対するファンの注目は高まっているものの、プロデューサーやトラックメイカーに関する情報にネット上で簡単にアクセスするこユーザーによって編集を重ねることができるプロデューサーのマイページを作成しました。
消費者が、コンテンツを議論していく機会が増えるとそのコンテンツはより成熟していきます。そのためのプラットフォームとなるようなアプリケーションが日本の音楽界にも必要だと考えています。

以下のシートをご覧ください。アプリケーションのペルソナが持つ課題を洗い出し、そして解決策となる実装の仕様を洗い出しました。
https://docs.google.com/spreadsheets/d/15NONtTfeuowLtXLK7th7-ibLVe5XZE9vzxkonlCXJV4/edit?usp=sharing

# 実装した機能についてのGIFと説明
＊サンプルデータとして登録されている固有名詞はすべて架空のものです。

歌詞投稿機能

ログインした状態で、ヘッダーから「曲を追加する」ボタンを押すか、こちらのURL（https://lyrics-annotation-app.herokuapp.com/songs/new）にアクセスするとご覧いただけます。必須項目をすべて御入力いただき、投稿ボタンを押すと、曲の投稿が可能になります。
この機能によって、「歌詞の注釈をつけるための曲」が登録できます。
実装にあたって工夫した点は、フォームオブジェクトを使用した保存機能と、投稿したyoutubeのurlを埋め込むことのできるビューの実装です。

検索機能

ヘッダーにある検索フォームから「みみこ」と検索していただけると、ご確認いただけます。
ユーザーは、曲に関連するキーワードを使って調べることが可能です。
この機能によって、「求めている曲の存在」を調べる材料が増えます。
実装にあたって工夫した点は、「曲名」、「歌詞」「和訳」「アーティスト名」「プロデューサー名」「コラボアーティスト名」のいずれかにキーワードが当てはまった商品を全て検索結果に表示させる機能の実装です。これによって拾える曲の範囲を大きくしました。

歌詞詳細ページ

ログインした状態で、ヘッダーから「曲を追加する」ボタンを押すか、こちらのURL（https://lyrics-annotation-app.herokuapp.com/songs/1）にアクセスするとご覧いただけます。
この機能によって、「曲の情報を閲覧する」ことができます。
実装にあたって工夫した点は、見やすいビューの実装です。情報量が多くなってしまうため、「曲の詳細」はブラウザの左側、「曲の注釈」は右側に分けました。また、記事のシェアボタンを押すと特定記事をツイッターでシェアすることができます。「歌詞を編集するボタン」から曲の情報を編集することができます。
個人ブログであれば、約5ページ以上に渡って表示させる内容量を1ページにまとめて表示させたことで、ユーザーのリロード回数を減らし、ストレスが少なく閲覧することができます。

sns登録/ログイン機能

こちらのURL(https://lyrics-annotation-app.herokuapp.com/users/sign_up)にアクセスしていただき、「Facebookで登録」または「Googleで登録」ボタンを押していただくと、それぞれのapiに遷移しsns情報を用いた簡易的な館員登録が可能になります。

歌詞注釈追加機能
ログインした状態で、こちらのURL(https://lyrics-annotation-app.herokuapp.com/songs/31/annotations/new)にアクセスしていただくと、フォームがご覧いただけます。
必須項目とそれぞれ任意の項目を入力していただき、投稿ボタンを押すと、投稿完了ページに遷移します。投稿完了ページにあります「投稿内容を確認する」ボタンを押すと詳細ページに遷移します。
この機能によって、「曲の注釈を加える」ことができます。
実装にあたって工夫した点は、ユーザーがどんな情報を書き込めばいいのかわかりやすいように、フォームん項目を細かく設定した点です。

非同期コメント機能
railsのフレームワークである「Action Cable」を使用してコメント機能を実装しました。
ログインした状態で、こちらのURL(https://lyrics-annotation-app.herokuapp.com/songs/1)にアクセスしていただくと、フォームとログインユーザーの投稿「可愛い！」がご覧いただけます。管理人以外は、ログインユーザーの投稿のみ削除することができます。
この機能によって、「ユーザーの感想を知る」ことができます。
実装にあたって工夫した点は、ユーザー名や削除ボタン・削除機能もコメントと一緒に非同期対応にした点です。

いいね機能
ログインした状態で、こちらのURL(https://lyrics-annotation-app.herokuapp.com/songs/1)にアクセスしていただくと、コメント一覧にあるコメントの横のサムズアップのアイコンがご確認いただけます。
この機能によって、「ユーザーの抱いている感想の動向を可視化する、共感を簡単に投じる」ことができます。
実装にあたって工夫した点は、1つの投稿に1つまでいいねすることができるように設定した点です。


アーティストマイページ機能
こちらのURL(https://lyrics-annotation-app.herokuapp.com/artists/1)にアクセスしていただくと、ご確認いただけます。
「プロフィールを編集する」ボタンから、登録されているプロフィール情報を編集することができます。
この機能によって、「アーティストの情報」が確認できます。
実装にあたって工夫した点は、snsのidを埋め込んだビューの表示です。

お問い合わせ機能
曲の詳細ページにある「通報する」ボタンか、こちらのURL(https://lyrics-annotation-app.herokuapp.com/index)にアクセスしていただくと、フォームがご覧いただけます。
この機能によって、ユーザーのお問い合わせ対応及、「サイトの質を担保」することができます。
実装にあたって工夫した点は、シンプルで見やすいビュー作りです。

# 実装予定の機能	
・コメントのいいね機能の非同期対応
・アーティストのフォロー機能と、フォロー一覧、いいねしたコメント一覧が確認できるユーザーマイページ
・歌詞の行数、または選択した範囲ごとの脚注投稿機能
・ユーザーへ運営からお知らせを送る機能
# データベース設計	
ER図
https://app.lucidchart.com/publicSegments/view/5388e995-f649-4e36-9ba7-c80cfcf1581b

```
 


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