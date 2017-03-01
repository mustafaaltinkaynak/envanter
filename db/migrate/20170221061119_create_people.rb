class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :telephone
      t.string :address
      t.text :desc
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
