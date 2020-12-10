ActiveAdmin.register Facility do
  # Facilityモデルのデータを更新を許可
  permit_params :type, :name, :postal_code, :address, :latitude, :longitude, :running_time, :tel, :email, :budget, :description, :advice, :holiday, :parking, :home_page, :owner_id, :instagram, :twitter, :youtube, :status, :created_user, :updated_user, :created_at, :updated_at, :opening_hours

  # 新規登録時のフォーム
  form do |f|
    f.inputs do
      f.input :type, as: :select, collection:Facility.types_i18n.invert
      f.input :name
      f.input :postal_code
      f.input :address
      f.input :latitude
      f.input :longitude
      f.input :running_time
      f.input :tel
      f.input :email
      f.input :budget
      f.input :description
      f.input :advice
      f.input :holiday
      f.input :parking
      f.input :home_page
      f.input :owner_id
      f.input :instagram
      f.input :twitter
      f.input :youtube
      f.input :status, as: :select, collection:Facility.statuses_i18n.invert
      f.input :created_user
      f.input :updated_user
      f.input :opening_hours
    end
    f.actions
  end

  # ユーザー一覧のカラムを指定
  index do
    selectable_column
    id_column
    column(:type) do |facility|
      facility.type_i18n
    end
    column :name
    column :postal_code
    column :address
    column :latitude
    column :longitude
    column :running_time
    column :tel
    column :email
    column :budget
    column :description
    column :advice
    column :holiday
    column :parking
    column :home_page
    column :owner_id
    column :instagram
    column :twitter
    column :youtube
    column(:status) do |facility|
      facility.status_i18n
    end
    column :created_user
    column :updated_user
    column :opening_hours
    column 'facility_images' do |facility|
      link_to '施設画像一覧', admin_facility_facility_images_path(facility.id)
    end
    column 'menu' do |facility|
      link_to 'メニュー 一覧',   admin_facility_menus_path(facility.id)
    end
    actions # 後述するpermit_paramsの設定に応じて閲覧編集削除などのリンクを表示
  end

  # ユーザー詳細画面の表示する項目を指定
  show do
    attributes_table do
      row :id
      row(:type) do |facility|
        facility.type_i18n
      end
      row :name
      row :postal_code
      row :address
      row :latitude
      row :longitude
      row :running_time
      row :tel
      row :email
      row :budget
      row :description
      row :advice
      row :holiday
      row :parking
      row :home_page
      row :owner_id
      row :instagram
      row :twitter
      row :youtube
      row(:status) do |facility|
        facility.status_i18n
      end
      row :created_user
      row :updated_user
      row :opening_hours
    end
  end

  sidebar "メニュー", only: [:show, :edit] do
    ul do
      li link_to '施設画像一覧', admin_facility_facility_images_path(resource)
      li link_to 'メニュー 一覧',   admin_facility_menus_path(resource)
    end
  end

  # 絞り込み条件の項目設定
  filter :type, as: :select, collection:Facility.types_i18n.invert.map{|key,value| [key, Facility.types[value]]}
  filter :name
  filter :postal_code
  filter :address
  filter :latitude
  filter :longitude
  filter :running_time
  filter :tel
  filter :email
  filter :budget
  filter :description
  filter :advice
  filter :holiday
  filter :parking
  filter :home_page
  filter :owner_id
  filter :instagram
  filter :twitter
  filter :youtube
  filter :status, as: :select, collection:Facility.statuses_i18n.invert.map{|key,value| [key, Facility.statuses[value]]}
  filter :created_user
  filter :updated_user
  filter :opening_hours
end
