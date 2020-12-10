ActiveAdmin.register User do
  # Userモデルのデータを更新を許可
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :created_at, :update_at, :nickname, :birth_year, :sex, :prefecture, :image, :role, :profile, :status, :password

  # 新規登録時のフォーム
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :nickname
      f.input :birth_year
      f.input :sex, as: :select, collection:User.sexes_i18n.invert
      f.input :prefecture
      f.input :image
      f.input :role,  as: :select, collection:User.roles_i18n.invert
      f.input :profile
      f.input :status,  as: :select, collection:User.statuses_i18n.invert
      f.input :mailmagazine
    end
    f.actions
  end

  # ユーザー一覧のカラムを指定
  index do
    selectable_column
    id_column
    column :email
    column :nickname
    column :birth_year
    column(:sex) do |user|
      user.sex_i18n
    end
    column :prefecture
    column :image
    column(:role) do |user|
      user.role_i18n
    end
    column :profile
    column(:status) do |user|
      user.status_i18n
    end
    column :mailmagazine
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
      row(:sex) do |user|
        user.sex_i18n
      end
      row :prefecture
      row :image
      row(:role) do |user|
        user.role_i18n
      end
      row :profile
      row(:status) do |user|
        user.status_i18n
      end
      row :mailmagazine
    end
  end

  # 絞り込み条件の項目設定
  filter :type
  filter :email
  filter :nickname
  filter :birth_year
  filter :sex, as: :select, collection:User.sexes_i18n.invert.map{|key,value| [key, User.sexes[value]]}
  filter :prefecture
  filter :image
  filter :role, as: :select, collection:User.roles_i18n.invert.map{|key,value| [key, User.roles[value]]}
  filter :profile
  filter :status, as: :select, collection:User.statuses_i18n.invert.map{|key,value| [key, User.statuses[value]]}
  filter :mailmagazine
end
