class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.references :company, foreign_key: true
      t.date :receipt_date
      t.date :guarantee_end_date
      t.string :location
      t.text :features

      t.timestamps
    end
  end
end
