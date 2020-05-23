User.find_or_create_by!(email: "test@example.com") do |user|
  user.password = "password"
  user.nickname = "test_user"
  user.birth_year = DateTime.now
  user.prefecture = 1
  user.sex = 0
  user.status = 1
end

puts "ユーザー投入成功"