User.find_or_create_by(email: "test@example.com") do |user|
  user.password = "password"
  user.nickname = "test_user"
  user.birth_year = 2000
  user.prefecture = 0
  user.sex = 0
  user.status = 1
end

puts "ユーザー投入成功"