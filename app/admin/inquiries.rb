ActiveAdmin.register Inquiry do
  # 管理画面で新規作成、削除を表示させない
  actions :all, except: [:new, :destroy]
  # 検索条件パネルの表示項目
  filter :status, as: :select, collection:Inquiry.statuses_i18n.invert.map{|key,value| [key, Inquiry.statuses[value]]}
  filter :kind, as: :select, collection:Inquiry.kinds_i18n.invert.map{|key,value| [key, Inquiry.kinds[value]]}
  filter :name
  filter :email
  filter :subject
#  filter :message
  filter :created_at
#  filter :updated_at

  # 管理画面で更新できる項目の設定
  permit_params :status, :admin_comment

  index do
    id_column
    column(:status) do |inquiry|
      inquiry.status_i18n
    end
    column(:kind) do |inquiry|
      inquiry.kind_i18n
    end
    column :user_id
    column :name
    column :facility_id
    column :email
    column :subject
#    column :message
    column :created_at
#    column :updated_at
    actions
  end

  form do |f|
    inputs "タイトル" do
      input :id,  input_html: { disabled: true }
      input :status, as: :select, collection:Inquiry.statuses_i18n.invert
      input :kind, input_html: { disabled: true }, as: :select, collection:Inquiry.kinds_i18n.invert
      input :user_id, input_html: { disabled: true }
      input :name, input_html: { disabled: true }
      input :email, input_html: { disabled: true }
      input :facility_id, input_html: { disabled: true }
      input :subject, input_html: { disabled: true }
      input :message, as: :text, input_html: { disabled: true }
      input :created_at, as: :string, input_html: { disabled: true }
      input :updated_at, as: :string, input_html: { disabled: true }
      input :admin_comment, as: :text
    end
    f.actions
  end

end
