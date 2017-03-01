ActiveAdmin.register AdminUser do
  menu label: 'Kullanıcılar', priority: 7

  index do
    selectable_column
    column :email
    column :sign_in_count
    actions
  end

  show do
    h3 admin_user.email
    div do
      simple_format admin_user.email
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
    end
    f.actions
  end

  permit_params(
    :email,
    :uid,
    :provider,
    :name,
    :AdminUser
  )
end
