20.times {Author.create!(name:Faker::Book.unique.author, about:Faker::Quote.famous_last_words)}

10.times {Genre.create!(name:Faker::Book.unique.genre)}

40.times {Book.create!(title:Faker::Book.unique.title, description:Faker::Lorem.paragraph, author_id:rand(1..20), genre_id:rand(1..10))}

5.times {
  user = User.create!(username:Faker::Internet.unique.username, email:Faker::Internet.unique.email, img_url:"")
         FavoriteBook.create!(user:user, book_id:rand(1..40))
         FinishedBook.create!(user:user, book_id:rand(1..40))
         ReadingNowBook.create!(user:user, book_id:rand(1..40))
         BucketListBook.create!(user:user, book_id:rand(1..40))
         Library.create!(user:user, book_id:rand(1..40))
}

80.times {
  opinion = Opinion.create!(content:Faker::Lorem.sentence, user_id:rand(1..5), book_id:rand(1..40))
            Like.create!(user_id:rand(1..5), opinion:opinion)
}



