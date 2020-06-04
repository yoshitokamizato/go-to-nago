class ImportCsv < ApplicationRecord
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        type: row["type"].to_i,
        name: row["name"],
        postal_code: row["postal_code"].to_i,
        address: row["address"],
        latitude: row["latitude"].to_f,
        longitude: row["longitude"].to_f,
        running_time: row["running_time"],
        tel: row["tel"],
        email: row["email"],
        budget: row["budget"].to_i,
        description: row["description"],
        advice: row["advice"],
        first_open: row["first_open"],
        first_close: row["first_close"],
        last_open: row["last_open"],
        last_close: row["last_close"],

        holiday: row["holiday"],
        parking: row["parking"],
        home_page: row["home_page"],
        owner_id: row["owner_id"].to_i,
        instagram: row["instagram"],
        twitter: row["twitter"],
        youtube: row["youtube"],
        status: row["status"].to_i,
        created_user: row["created_user"].to_i,
        updated_user: row["updated_user"].to_i,
        user_id: row["user_id"].to_i
      }
    end
    puts "インポート処理を開始"
    # インポートができなかった場合の例外処理
    p list
    begin
    Facility.create!(list)
    puts "インポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError"
    end
  end
end
