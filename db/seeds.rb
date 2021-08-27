20.times {Author.create!(name:Faker::Book.unique.author, about:Faker::Quote.famous_last_words)}

80.times {Book.create!(title:Faker::Book.unique.title, description:Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), author_id:rand(1..20))}

20.times {
  user = User.create!(username:Faker::Internet.unique.username, email:Faker::Internet.unique.email, img_url:"", password:"asd123", password_confirmation:"asd123")
         FavoriteBook.create!(user:user, book_id:rand(1..80))
         FinishedBook.create!(user:user, book_id:rand(1..80))
         ReadingNowBook.create!(user:user, book_id:rand(1..80))
         BucketListBook.create!(user:user, book_id:rand(1..80))
}

80.times {
  opinion = Opinion.create!(content:Faker::Lorem.sentence, user_id:rand(1..5), book_id:rand(1..40))
            Like.create!(user_id:rand(1..5), opinion:opinion)
}

