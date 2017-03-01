class AddMarkToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :mark, foreign_key: true
  end
end
