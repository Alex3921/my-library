# My Library

## Overview

This app serves as an online library where users can keep track of their collection of books through flags like favorites, reading now, finished, bucket list. The app enables users to sign up either by filing up a form or using their Google account.

## About this project

This web app was built using Ruby on Rails.
## Local Installation

1. Clone the repository into your local environment by copying the following into your terminal:
  
    >*$ git clone [git@github.com:Alex3921/my-library.git](git@github.com:Alex3921/my-library.git)*
  
2. Run 'bundle install' to install the necessary [Ruby Gems](https://rubygems.org/) and dependencies:

    >*$ bundle install*
        
3. Run the database migrations:

    >*$ rake db:migrate

4. Seed the database with some dummy data:

    >*$ rake db:seed

5. Start the local rails server:

    >*$ rails s

6. Go to localhost:3000 to test the app.

## Enable Google Login
To enable a user to login with Google, you will have to create the .env file at the highest level of your app(type ```touch .env``` in your console) and add the following inside the newly created file:

GOOGLE_CLIENT_ID="YOUR_CLIENT_ID"
GOOGLE_CLIENT_SECRET="YOUR_CLIENT_SECRET"

Instructions: [Google OAuth2 for Rails](https://medium.com/@jenn.leigh.hansen/google-oauth2-for-rails-ba1bcfd1b863)

Note: Since the .env file contains sensitive information, it should not be tracked, committed or pushed to Github. We can achieve this by simply adding it to our ```.gitignore``` file.
## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/Alex3921/my-library.git. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
