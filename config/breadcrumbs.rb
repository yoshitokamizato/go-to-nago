crumb :root do
  link "home", root_path
end

crumb :gourmets do
  link "グルメ", facilities_list_path(type: "gourmet")
  parent :root
end

# グルメ個別ページのパンくずリスト
crumb :gourmet do |facility|
  link facility.name
  parent :gourmets
end

crumb :spots do
  link "観光スポット", facilities_list_path(type: "spot")
  parent :root
end

# 観光スポット個別ページのパンくずリスト
crumb :spot do |facility|
  link facility.name
  parent :spots
end

crumb :mypage do
  link "マイページ"
  parent :root
end

crumb :favorite do
  link "お気に入り（グルメ・観光スポット）"
  parent :root
end

crumb :facility_type do |type_text|
  link type_text.to_s
  parent :root
end

crumb :about do
  link "名護へGoについて"
  parent :root
end

crumb :about do
  link "名護へGoについて"
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
