class CreateArchives < ActiveRecord::Migration[5.0]
  def change
    create_table :archives do |t|
      t.text :desc
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
