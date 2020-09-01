ActiveAdmin.register Facility do
  # Facilityモデルのデータを更新を許可
  permit_params :type, :name, :postal_code, :address, :latitude, :longitude, :running_time, :tel, :email, :budget, :description, :advice, :first_open, :first_close, :last_open, :last_close, :holiday, :parking, :home_page, :owner_id, :instagram, :twitter, :youtube, :status, :created_user, :updated_user, :created_at, :updated_at, :user_id

  # 新規登録時のフォーム
  form do |f|
    f.inputs do
      f.input :type, as: :select, collection:Facility.type_i18n.invert
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
      f.input :first_open
      f.input :first_close
      f.input :last_open
      f.input :last_close
      f.input :holiday
      f.input :parking
      f.input :home_page
      f.input :owner_id
      f.input :instagram
      f.input :twitter
      f.input :youtube
      f.input :status, as: :select, collection:Facility.status_i18n.invert
      f.input :created_user
      f.input :updated_user
      f.input :user_id
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
    column :first_open
    column :first_close
    column :last_open
    column :last_close
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
    column :user_id
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
      row :first_open
      row :first_close
      row :last_open
      row :last_close
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
      row :user_id
    end
  end
end
