# Chirpr

Chirpr is a Twitter analog.

## Dependencies
* Ruby ~> 2.3.3
* PostgreSQL (SQLite for development)
* ImageMagick

### Gems
* devise
* carrierwave
* bootstrap-sass
* font-wesome-sass ~> 5.0.13
* mini_magick
* google-webfonts ~> 0.3.2
* pg
### Testing Gems
* database_cleaner
* cucumber-rails

## How to run locally
After cloning the repository, run `bundle install` to install all gems. Then run `rails db:setup` and `rails db:migrate` to initialize the database. From there, run `rails server` or `rails s` to run. This can be accessed from `localhost:3000`.

## Deployment
Currently, images are not supported until connection with AWS S3 is implemented. However, it can be implemented as is through Heroku.