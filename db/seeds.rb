User.find_or_create_by!(email: "test@example.com") do |user|
  user.password = "password"
  user.nickname = "test_user"
  user.birth_year = DateTime.now.year
  user.prefecture = 1
  user.sex = 0
  user.status = 1
  user.confirmed_at = Time.now
end
puts "ユーザー投入成功"
User.find_or_create_by!(email: "test2@example.com") do |user|
  user.password = "password"
  user.nickname = "test_user2"
  user.birth_year = DateTime.now.year
  user.prefecture = 1
  user.sex = 0
  user.status = 1
  user.confirmed_at = Time.now
end

puts "ユーザー2投入成功"
AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password") if Rails.env.development?
puts "管理者投入成功"

User.find_or_create_by!(email: "test3@example.com") do |user|
  user.password = "password"
  user.nickname = "test_user3"
  user.birth_year = DateTime.now.year
  user.prefecture = 1
  user.sex = 0
  user.status = 1
  user.confirmed_at = Time.now
end

puts "動作確認用ユーザー3投入成功"
