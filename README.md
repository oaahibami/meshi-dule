# アプリケーション名
メシジュール（メシ+スケジュール）

# アプリケーション概要
親しい友人グループ内でのユーザー同士で食事に誘えるツールとしてコミュニケーションを取る事が出来る。  
予めイベント日時や店舗が決まっており、参加可否を登録するだけで参加者管理が出来る。  
イベント終了後はイベント詳細よりコメント機能でイベントの写真を共有する事が出来る。  

# 利用方法
## イベント投稿
1.トップページ（一覧ページ）のヘッダーから新規登録を行う。  
2.新規イベント投稿ボタンから、イベントの内容（イベントのタイトル・イベントの詳細・店舗・日時）を投稿する。  

## コメント投稿
1.参加メンバーは参加可否を選択し、イベント詳細にて参加者を確認・参加/不参加ボタンを押下する時に任意でコメントを投稿出来る。  
2.参加/不参加を投稿するメンバーが他のジャンルの店舗をコメントから提案する事が出来る。  

# アプリケーションを作成した背景
なかなか会えない友人や仲間と食事の予定を組む幹事を担当する時に、店舗選びに苦労した事が課題となった。  
「いつの何時にこのお店に集まれる人」と呼びかける事で幹事の負担軽減になると考えた。  
また、イベント終了後にはコメント詳細のコメント投稿機能でイベントで撮影した写真を投稿する事が出来る機能もあり、写真や動画共有が簡単に出来るのでLINEと使い分けなくてもいいので手軽となると考える。  

# 洗い出した要件
https://docs.google.com/spreadsheets/d/11w7gcgHj3JLqAGrPTuWFktIj8aC17aYAE5shQQUr3HE/edit#gid=982722306

# 実装予定の機能
1.BASIC認証の導入  
2.イベント投稿機能  
3.イベント一覧機能  
4.イベント詳細機能  
5.イベント編集機能  
6.イベント削除機能  
7.イベント毎に開催終了後は思い出としてアルバム機能とする事が出来るようコメント機能でも任意で画像投稿出来るようにする。  

# テーブル設計

## Usersテーブル
| Column             | Type   | Options                           |
|--------------------|--------|-----------------------------------|
| nickname           | string | null: false                       |
| email              | string | null: false, unique: true         |
| encrypted_password | string | null: false                       |

### Association
- has_many :events
- has_many :comments


## eventsテーブル
| Column             | Type        | Options                           |
|--------------------|-------------|-----------------------------------|
| event_title        | string      | null: false                       |
| event_description  | string      | null: false                       |
| comment            | string      | null: false                       |
| user               | references  | null: false, foreign key: true    |

### Association
- belongs_to :user
- has_many :comment


## commentsテーブル
| Column             | Type        | Options                           |
|--------------------|-------------|-----------------------------------|
| user               | references  | null: false, foreign key: true    |
| event              | references  | null: false, foreign key: true    |

### Association
- belongs_to :user
- belongs_to :comment