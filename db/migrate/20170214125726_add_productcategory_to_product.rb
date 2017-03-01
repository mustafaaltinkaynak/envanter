class AddProductcategoryToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :productcategory, foreign_key: true
  end
end
