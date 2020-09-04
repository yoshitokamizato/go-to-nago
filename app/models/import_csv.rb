class ImportCsv < ApplicationRecord
  # CSVデータのパスを引数として受け取り、インポート処理を実行

  def self.import(path)
    list = []
    list_image = []
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
      list_image << {
        facility_id: row["facility_id"].to_i,
        # image: row["image"],
        image: "#{Rails.root}/public/facility_image/" + row["image"],
        order: row["order"].to_i,
        created_user: row["created_user"].to_i
      }
    end

    puts "----------------------------"
    puts list
    puts "----------------------------"
    puts list_image
    puts "----------------------------"
    puts "インポート処理を開始"
    # インポートができなかった場合の例外処理
    begin
      Facility.create!(list)
      # FacilityImage.create!(list_image)
      puts "Facilityインポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "Facilityインポートに失敗：UnknownAttributeError"
    end

    begin
      list_image.each do |data|
        facility_image = FacilityImage.new(data)
        File.open(data[:image]) do |f|
          facility_image.image = f
        end
        facility_image.save!
      end
      puts "FacilityImage インポート完了！！"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "FacilityImage インポートに失敗：UnknownAttributeError"
    end
  
        
  end

  def self.import_two(path)
    list = []
    list_image = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        facility_id: row["facility_id"].to_i,
        name:  row["name"],
        price: row["price"].to_i,
        # image: row["image"],
        image: "#{Rails.root}/public/menu_image/" + row["image"],
        content: row["content"],
        created_user: row["created_user"].to_i,
        updated_user: row["updated_user"].to_i
      }
    end

    puts "----------------------------"
    puts list
    puts "----------------------------"
    puts "MENUのインポート処理を開始"
    # インポートができなかった場合の例外処理
    # begin
    #   Menu.create!(list)
    #   puts "MENUインポート完了!!"
    # rescue ActiveModel::UnknownAttributeError => invalid
    #   puts "インポートに失敗：UnknownAttributeError"
    # end
    #
    # carrierwaveを使用した画像upload方式に変更
    begin
      list.each do |data|
        menu = Menu.new(data)
        File.open(data[:image]) do |f|
        menu.image = f
        end
        menu.save!
      end
      puts "Menuインポート完了！！"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError"
    end
  end
end
