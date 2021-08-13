class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :opinion_id

      t.timestamps null: false
    end
  end
end
