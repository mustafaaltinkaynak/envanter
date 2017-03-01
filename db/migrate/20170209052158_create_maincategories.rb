class CreateMaincategories < ActiveRecord::Migration[5.0]
  def change
    create_table :maincategories do |t|
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
