ActiveAdmin.register Inquiry do
  # 管理画面で新規作成、削除を表示させない
  actions :all, :except => [:new, :destroy] 
  # 検索条件パネルの表示項目
  filter :status, as: :select
  # 管理画面で更新できる項目の設定  
  permit_params :status

  index do
    id_column
    column :status
    column :user_id
    column :name
    column :subject
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    inputs 'タイトル' do
      input :id,  :input_html => { :disabled => true }
      input :status, :as => :select
      input :user_id,  :input_html => { :disabled => true }
      input :name,  :input_html => { :disabled => true }
      input :email,  :input_html => { :disabled => true }
      input :subject, :input_html => { :disabled => true }
      input :message, :input_html => { :disabled => true }
      input :created_at, :as => :string, :input_html => { :disabled => true }
      input :updated_at, :as => :string, :input_html => { :disabled => true }
    end
    f.actions
  end
end
