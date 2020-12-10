ActiveAdmin.register FacilityImage do
  belongs_to :facility
  permit_params :image, :order, :created_user

  # 表示順序の昇順で表示
  config.sort_order = 'order_asc'

  index do
    selectable_column
    column :image do |r|
      link_to image_tag(r.image.thumb.url, class: 'image-thumbnail'),
        admin_facility_facility_image_path(r.facility_id, r.id)  if r.image.url
    end
    id_column
    column :order
    actions
  end

  show do
    attributes_table do
      row :id
      row :image do |r|
        image_tag r.image.url if r.image.url
      end
      row :order
      row :created_user
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :order
      f.input :image, :image_preview => true
      f.input :created_user, input_html: { value: current_admin_user.id, readonly: true}
    end
    f.actions
  end

  # 絞り込み条件の項目設定
  filter :order
  filter :created_user
end
