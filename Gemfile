source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }



gem 'rails', '~> 5.2.1'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

gem 'devise'
gem "bootstrap-sass"
gem "jquery-rails"
gem 'jquery-ui-rails'
gem 'rails-ujs', '~> 5.1.0.beta1'
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"
gem 'geocoder'
gem "private_pub"
gem "thin"
gem 'dropzonejs-rails'
gem 'refile-s3'
gem "paperclip", "~> 5.0.0.beta1"
gem 'aws-sdk', '~> 2.3'
gem 'figaro'
gem 'json_pure'
gem 'impressionist'
gem 'gretel'
gem 'toastr-rails'
gem 'rake'
gem 'dotenv-rails'
gem 'rails-i18n'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'rails_autolink'
gem 'jquery-turbolinks'
gem 'kaminari'
gem 'browser'

group :production do
  gem 'json'
  gem 'mysql2'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
