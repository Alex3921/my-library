class CreateReadingNowBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :reading_now_books do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
