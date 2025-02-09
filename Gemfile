source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.2.4", ">= 5.2.4.1"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 3.11"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
gem 'sass'
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
gem 'acts_as_votable'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Generate top level documentation on model
gem "annotate"
gem "bootstrap-sass", "~> 3.3.6"
gem "carrierwave"
gem "debug_inspector", "~> 0.0.3"
gem "faker"
gem "geocoder", "~> 1.6", ">= 1.6.1"
gem "image_magick"
gem "jquery-rails"
gem "paper_trail"
gem "rails_admin", "~> 2.0"
gem "virtus"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Gem for authentication
gem "devise"
gem "pry"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "factory_bot_rails"
  gem "rspec", "~> 3.9"
  gem "rspec-rails", "~> 3.9"
  gem "rubocop", require: false
  gem "rubocop-performance"
  gem "rubocop-rspec"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "test-unit"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "database_cleaner-active_record"
  gem "selenium-webdriver"
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem "chromedriver-helper"
  gem "rails-controller-testing"
  gem "shoulda", "3.5.0"
  gem "shoulda-matchers", "2.8.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
