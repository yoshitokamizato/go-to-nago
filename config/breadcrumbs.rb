crumb :root do
  link "home", root_path
end

# 施設一覧
crumb :facility_index do |facility_type|
  if facility_type == "gourmet"
    link "グルメ", gourmets_list_path
  else
    link "観光スポット", spots_list_path
  end
  parent :root
end

# 施設個別ページ
crumb :facility do |facility|
  link facility.name, facility_path(facility)
  parent :facility_index, facility.type
end

# メニュー一覧
crumb :menus do |facility|
  link 'メニュー'
  parent :facility, facility
end

crumb :mypage do
  link "マイページ"
  parent :root
end

crumb :favorite do
  link "お気に入り"
  parent :root
end

crumb :about do
  link "名護へGOについて"
  parent :root
end

crumb :company do
  link "運営会社"
  parent :root
end

crumb :privacy do
  link "プライバシーポリシー"
  parent :root
end

crumb :tos do
  link "利用規約"
  parent :root
end
