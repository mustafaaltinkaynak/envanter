# This file should contain all the record
# creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).

AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
)

department_list = [
  'Yönetim',
  'İdari İşler',
  'Sistem Yönetimi Birimi',
  'Yazılım Birimi',
  'İçerik Geliştirme Birimi',
  'Öğrenci İşleri Birimi',
  'Sınav Birimi',
  'Destek Birimi',
  'Yardımcı Hizmetler Birimi'
]

department_list.each do |title|
  Department.create(title: title)
end

person_list = [
  ['Prof. Dr. Mehmet Ali Cengiz', 1],
  ['Prof. Dr. İzzet Akça', 1],
  ['Yrd. Doç. Dr. Recai Oktaş', 1],
  ['Abdullah Özyürek', 6],
  ['Can Murat Demir', 5],
  ['Dilek Özcan', 2],
  ['Ecmel Kaytazoğlu', 4],
  ['Elif Merve Karamustafa', 5],
  ['Emrah Altun', 5],
  ['Emre Demir', 3],
  ['Emre Şengün', 5],
  ['Ercan Bayak', 5],
  ['Ertuğrul Duran', 7],
  ['Halil Karakaya', 5],
  ['Hakkı Gözütok', 7],
  ['İhsan Müjde', 2],
  ['İlker Müftoğlu', 5],
  ['İrfan Subaş', 4],
  ['Mustafa Altınkaynak', 3],
  ['Ramazan Güneş', 9],
  ['Orhan Aktaş', 2],
  ['Sahire Doğru', 5],
  ['Sedanur Kıran', 6],
  ['Sezen Aksu', 7],
  ['Yasemin Çetin', 7],
  ['Zeliha Çetin', 9]
]

person_list.each do |name, department_id|
  Person.create(name: name, department_id: department_id)
end

main_category_list = [
  'Bilişim',
  'Mobilya - Ofis Malzemeleri',
  'Kırtasiye'
]

main_category_list.each do |title|
  Maincategory.create(title: title)
end

sub_category_list = [
  ['Sunucu', 1],
  ['PC (Kişisel) Bilgisayarlar', 1]
]

sub_category_list.each do |title, maincategory_id|
  Subcategory.create(title: title, maincategory_id: maincategory_id)
end
