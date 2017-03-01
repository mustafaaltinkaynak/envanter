ActiveAdmin.register Product do
  menu label: 'Ürünler', priority: 6

  filter :by_maincategory_in,
         label: 'Ana Kategori', as: :select,
         collection: proc { Maincategory.all.map { |a| [a.title, a.id] } }

  filter :by_subcategory_in,
         label: 'Alt Kategori', as: :select,
         collection: proc { Subcategory.all.map { |a| [a.title, a.id] } }

  filter :mark, label: 'Marka'
  filter :company, label: 'Firma'
  filter :title, label: 'Ürün Adı'
  filter :person, member_label: :name
  filter :receipt_date
  filter :guarantee_end_date
  filter :price
  filter :location

  index do
    selectable_column
    column '#', :id
    column 'Firma', :company_id
    column 'Kategori' do |category|
      category.productcategory.first.maincategory.title
    end
    column 'Alt Kategori' do |subcategory|
      subcategory.productcategory.first.subcategory.title
    end
    column 'Ürün Adı', :title
    column 'Alınma Tarihi', :receipt_date
    column 'Garanti Bitiş Tarihi', :guarantee_end_date
    column 'Lokasyon', :location
    column 'Arşiv' do |archive|
      Archive.exists?(product_id: archive.id) ? status_tag('active', :error, class: 'important', label: 'ARŞİV') : ''
    end
    actions
  end

  form do |f|
    f.inputs 'Yeni Ürün' do
      f.input(
        :maincategory_id,
        label: 'Ana Kategori',
        as: :select2,
        selected: product.id.nil? ? '' : product.productcategory.first.maincategory_id,
        collection: Maincategory.all.map { |c| [c.title.to_s, c.id] }
      )
      f.input(
        :subcategory_id,
        label: 'Alt Kategori',
        as: :select2,
        selected: product.id.nil? ? '' : product.productcategory.first.subcategory_id,
        collection: Subcategory.all.map { |c| [c.title.to_s, c.id] }
      )
      f.input :company, as: :select2, label: 'Firma'
      f.input :mark, as: :select2, label: 'Marka'
      f.input :person,
              as: :select2,
              label: 'Sorumlu Personel',
              member_label: :name
      f.input :title, label: 'Ürün Adı'
      f.input :receipt_date, label: 'Alınma Tarihi'
      f.input :guarantee_end_date, label: 'Garanti Bitiş Tarihi'
      f.input :price, label: 'Ücret'
      f.input :location, label: 'Lokasyon'
      f.input :features, label: 'Ek Not'
    end
    f.button :Submit
  end

  permit_params(
    :maincategory_id,
    :subcategory_id,
    :mark_id,
    :company_id,
    :person_id,
    :title,
    :receipt_date,
    :guarantee_end_date,
    :location,
    :price,
    :features,
    :Product
  )
end
