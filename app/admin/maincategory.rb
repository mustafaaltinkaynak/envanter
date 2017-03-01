ActiveAdmin.register Maincategory do
  menu label: 'Ana Kategoriler', priority: 5

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    column 'Kategori Adı', :title
    column 'Açıklama', :desc
    actions
  end

  permit_params :title, :desc, :Maincategory
end
