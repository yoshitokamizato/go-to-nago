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