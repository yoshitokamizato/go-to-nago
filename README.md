# README

## Ruby version

   2.6.4

## Rails version

  Rails 6.0.3.1

## DB

mysql  Ver 8.0.19

## 初期データ投入方法
現時点のデータの読み込みは以下でお願いします（統一できておらずすみません）

<概要>

1. ユーザー情報等　→　seedファイルから読み込み
2. 施設・グルメ情報・ メニューデータ　→　csvからインポート（添付コマンド参照）

<詳細>

1. ` rails db:seed `

2-1. 施設・グルメ情報を読み込み

` ImportCsv.import('db/csv_data/facility_data.csv')  `

2.2 メニューデータの読み込み

` ImportCsv.import_two('db/csv_data/menu_data.csv') `

## .envファイルの設定

databaseの情報（db名、アカウント、パスワード）などの環境ごとに異なる情報は、環境ごとに設定する`.env`ファイル(git管理対象外)に記載する方針としている。
各自の開発環境を設定する際には、雛形である`.env.sample`(git管理)をコピーして`env`ファイルを作成し、各自の環境の設定内容を記載すること。本番デプロイ時にも同様に、本番環境の`.env`ファイルに設定を記載する

### 注意点
- `.env`に設定内容を追加した際には、`.env.sample`にも項目を追加して、pushすること
- git pullを行った際に、`.env.sample`が更新された場合には内容を確認し、git pullを行った環境（開発環境・本番環境）の`.env`にも設定を追加すること


## github(branch)運用方法

7/22の定例を受けて、新たに`develop`ブランチを設けることとしたため、以下の運用方法となります。

### develop（開発用ブランチ）
開発を行う場合には、`develop`ブランチから各開発用のブランチを切って、push後は`develop`ブランチに対してmergeをしてください。

### master（本番用ブランチ）
本番環境へのデプロイを行う場合は、`develop`ブランチの内容を`master`ブランチにマージしたうえで、
本番環境側で`master`ブランチよりpullをおこなってください。

### rubocop (静的解析ツール)
コードの質の向上のため、rubocopの運用をお願い致します。

使用するコマンドは以下の通り。
rubocop -a:コードチェック & 自動修正
git config pre-commit.checks rubocop：commit前にrubocopコマンドを行う設定

## github(プルリクエストした後のフロー) (2020/7/25~)

### 以下の条件を満たした場合、マージしてOKです。

- developブランチの動作保証がされていること。
- 他メンバー誰か1人にレビューされていること。（二人ならなおよし）

## その他

### Knowledgeを残そう
開発の過程で得た知見は蓄積していきましょう!

**手順**

- [knowledge](https://github.com/yoshitokamizato/go-to-nago/wiki/knowledge)を確認
- knowledgeを参考に[wikiに新しくページを追加](https://github.com/yoshitokamizato/go-to-nago/wiki/_new)(タイトルは ”topic_XXX”)
- [knowledge](https://github.com/yoshitokamizato/go-to-nago/wiki/knowledge)のリストに作成したpageのタイトル・リンクを追加
