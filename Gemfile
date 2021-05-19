source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.4.6"

group :production do
  gem "pg", "0.20.0"
end

gem "bootstrap-sass", "3.3.7"
gem "figaro"
gem "jquery-rails"

group :development, :test do
  gem "byebug", "9.0.6", platform: :mri
  gem "rubocop", "~> 0.54.0", require: false
  gem "sqlite3", "1.3.13"
end

gem "bcrypt", "3.1.12"
gem "bootstrap-kaminari-views"
gem "carrierwave", "1.2.2"
gem "cloudinary"
gem "config"
gem "faker", "1.7.3"
gem "i18n-js"
gem "kaminari"
gem "mini_magick", "4.7.0"
gem "rails", "~> 5.2.3"
gem "rails-i18n"

# Use sqlite3 as the database for Active Record
# gem "sqlite3"
# Use Puma as the app server
gem "puma", "~> 4.3"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "mini_racer", platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

group :development do
  # Access an interactive console on exception pages or
  # by calling "console" anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by
  # keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
