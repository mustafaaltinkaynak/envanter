ActiveAdmin.register Person do
  menu label: 'Personel', priority: 3
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
    column 'Birim', :department_id
    column 'Adı ve Soyadı', :name
    actions
  end

  permit_params(
    :department_id,
    :name,
    :telephone,
    :address,
    :Person
  )
end
