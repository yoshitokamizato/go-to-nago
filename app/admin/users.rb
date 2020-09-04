ActiveAdmin.register User do
  # Userモデルのデータを更新を許可
  permit_params :email, :encrypted_password, :reset_password_token, :created_at, :update_at, :nickname, :birth_year, :sex, :prefecture, :image, :role, :profile, :status, :password

  # 新規登録時のフォーム
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :nickname
      f.input :birth_year
      f.input :sex
      f.input :prefecture
      f.input :image
      f.input :role
      f.input :profile
    end
    f.actions
  end

  # ユーザー一覧のカラムを指定
  index do
    selectable_column
    id_column
    column :email
    column :password
    column :nickname
    column :birth_year
    column :sex
    column :prefecture
    column :image
    column :role
    column :profile
    actions # 後述するpermit_paramsの設定に応じて閲覧編集削除などのリンクを表示
  end

  # ユーザー詳細画面の表示する項目を指定

  show do
    attributes_table do
      row :id
      row :email
      row :password
      row :nickname
      row :birth_year
      row :sex
      row :prefecture
      row :image
      row :role
      row :profile
    end
  end
end
