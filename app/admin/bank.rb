ActiveAdmin.register Bank do

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :active
      f.input :notification_email
      f.input :notification_phone, input_html: {class: 'masked_phone'}
    end

    f.actions
  end

  show do |house|
    attributes_table do
      row :title
      row :active
      row :notification_email
      row :notification_phone
      row :image do
        image_tag house.preview.file.thumb.url if house.preview.present?
      end
    end
    active_admin_comments
  end

  index do
    column :preview do |bank|
      image_tag bank.preview.file.thumb.url if bank.preview.present?
    end
    column :title
    column :active
    column :notification_email
    column :notification_phone
    column :images do |bank|
      ul do
        li link_to "Картинки #{bank.images.count}", admin_resource_images_url(bank)
        li link_to "Добавить", new_admin_image_url(image: { resource_type: 'Bank', resource_id: bank.id})
      end
    end

    actions
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  #
  permit_params *Bank.attribute_names

end
