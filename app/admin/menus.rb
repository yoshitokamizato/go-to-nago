ActiveAdmin.register Menu do
  belongs_to :facility
  permit_params :name, :price, :content, :image, :created_user, :updated_user

  index do
    selectable_column
    column :image do |menu|
      # link_to image_tag("/menu_image/"+menu.image , class: 'image-thumbnail'), admin_facility_menu_path(menu.facility_id, menu.id)
      link_to image_tag(menu.image.url, class: 'image-thumbnail'), admin_facility_menu_path(menu.facility_id, menu.id) if menu.image.url
    end
    id_column
    column :name
    column :price
    column :content
    actions
  end

  # index as: :grid, columns: 5 do |menu|
  #   a href: admin_facility_menu_path(menu.facility_id, menu.id) do
  #     img src: image_path("/menu_image/"+menu.image), class: 'image-thumbnail'
  #     div menu.name
  #   end
  # end


  show do
    attributes_table do
      row :id
      row :name
      row :image do |menu|
        # image_tag "/menu_image/"+menu.image, class: 'image-thumbnail'
        image_tag menu.image.url, class: 'image-thumbnail' if menu.image.url
      end
      row :price
      row :content
      row :created_user
      row :updated_user
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :content
      f.input :created_user
      f.input :updated_user
      # f.file_field :image, accept: "image/jpg,image/gif,image/jpeg,image/png"
      # f.input :image, as: :file
      # f.input :image, as: :file, :image => proc { |o| o.image.url(:thumb) }
      f.input :image, :image_preview => true
    end
    f.actions
  end
end