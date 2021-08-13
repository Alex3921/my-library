class CreateOpinions < ActiveRecord::Migration[6.1]
  def change
    create_table :opinions do |t|
      t.text :content
      
      t.integer :user_id
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
