class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
