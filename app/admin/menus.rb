ActiveAdmin.register Menu do
  belongs_to :facility
  permit_params :name, :price, :content, :image, :created_user, :updated_user, :order

  # 表示順序の昇順で表示
  config.sort_order = 'order_asc'

  index do
    selectable_column
    column :image do |menu|
      link_to image_tag(menu.image.url, class: 'image-thumbnail'), admin_facility_menu_path(menu.facility_id, menu.id) if menu.image.url
    end
    id_column
    column :name
    column :price
#    column :content
    column :order
    actions
  end


  show do
    attributes_table do
      row :id
      row :name
      row :image do |menu|
        image_tag menu.image.url, class: 'image-thumbnail' if menu.image.url
      end
      row :price
      row :content
      row :order
      row :created_user
      row :updated_user
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :price
      f.input :content
      f.input :order
      f.input :created_user, input_html: { value: current_admin_user.id, readonly: true}
      f.input :updated_user, input_html: { value: current_admin_user.id, readonly: true}
      f.input :image, :image_preview => true
    end
    f.actions
  end

  # 絞り込み条件の項目設定
  filter :name
  filter :price
end
