ActiveAdmin.register Tariffe do

  index do
    column :id
    column :active
    column :title
    column :month_fee
    column :invoice_fee
    column :cashing_fee
    column :bank
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
  permit_params *Tariffe.attribute_names
  
end
