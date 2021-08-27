class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :cover
      t.text :description
      
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
