class CreateMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
