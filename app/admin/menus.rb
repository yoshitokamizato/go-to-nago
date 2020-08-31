ActiveAdmin.register Menu do
  belongs_to :facility

  index do
    selectable_column
    column :image do |menu|
      link_to image_tag("/menu_image/"+menu.image , class: 'image-thumbnail'), admin_facility_menu_path(menu.facility_id, menu.id)
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
        image_tag "/menu_image/"+menu.image, class: 'image-thumbnail'
      end
      row :price
      row :content
      row :created_user
      row :updated_user
      row :created_at
      row :updated_at
    end
  end
end