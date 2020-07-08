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
