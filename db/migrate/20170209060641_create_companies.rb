class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :title
      t.string :address
      t.string :telephone
      t.string :email
      t.string :fax
      t.text :desc

      t.timestamps
    end
  end
end
