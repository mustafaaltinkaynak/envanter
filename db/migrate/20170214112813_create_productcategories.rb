class CreateProductcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :productcategories do |t|
      t.references :maincategory
      t.references :subcategory
      t.references :product
      t.timestamps
    end
  end
end
