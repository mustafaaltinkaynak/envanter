class AddPersonRefToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :person, foreign_key: true
  end
end
