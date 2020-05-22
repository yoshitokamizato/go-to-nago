a=0
flag=true
while flag do
  Facility.find_or_create_by(user_id: 2) do |f|
    f.type=0
    f.name="居酒屋"
    f.postal_code=8880000
    f.address="東京都杉並区荻窪4丁目30番16号"
    f.latitude=35.703759710876
    f.longitude=139.62397978301
    f.description="アメリカン・エキスプレス・インターナショナル，Ｉｎｃ．"
    f.parking="有（６台）"
    f.user_id=1
    f.created_user= 1
    f.updated_user= 1
  end
  Facility.find_or_create_by(user_id: 2) do |f|
    f.type=1
    f.name="八百屋さん"
    f.postal_code=8880000
    f.address="東京都杉並区荻窪4丁目30番16号"
    f.latitude=35.703759710876
    f.longitude=139.62397978301
    f.description="アメリカン・エキスプレス・インターナショナル，Ｉｎｃ．"
    f.parking="有（６台）"
    f.user_id=1
    f.created_user= 1
    f.updated_user= 1
  end
  puts "facilities成功"
  FacilityImage.find_or_create_by(facility_id: a+1) do |f|
        f.image = "hogwort.jpg"
        f.order = 0
        f.created_user = 1
  end
  FacilityImage.find_or_create_by(facility_id: 10+a+1) do |f|
        f.image = "quiz.png"
        f.order = 0
        f.created_user = 2
  end
  puts "facility_images成功"
  a += 1
  if a==10
    flag = false
  end
end

Menu.find_or_create_by(facility_id: 0) do |f|
      f.name = "test"
      f.price = 100
      f.image = "hogwort.jpg"
      f.content = "test2 hogehogeghoeghoge"
      f.created_user = 1
      f.updated_user = 1
    end
puts "menus成功"
Menu.find_or_create_by(facility_id: 1) do |f|
      f.name = "test2"
      f.price = 200
      f.image = "quiz.png"
      f.content = "test2 hogehogeghoeghoge"
      f.created_user = 2
      f.updated_user = 2
end
puts "menus2成功"




User.find_or_create_by(email: "test@example.com") do |user|
  user.password = "password"
  user.nickname = "test_user"
  user.birth_year = 2000
  user.prefecture = 1
  user.sex = 0
  user.status = 1
end
puts "ユーザー投入成功"
User.find_or_create_by(email: "test2@example.com") do |user|
  user.password = "password"
  user.nickname = "test_user2"
  user.birth_year = 2000
  user.prefecture = 1
  user.sex = 0
  user.status = 1
end

puts "ユーザー2投入成功"
