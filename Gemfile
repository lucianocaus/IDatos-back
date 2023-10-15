source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.0.6'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.4', '>= 1.4.4'

# Use device_token_auth gem for authentication
gem 'devise_token_auth', '~> 1.2', '>= 1.2.1'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'sidekiq', '~> 7.0'

gem 'rack-cors', '~> 1.1', '>= 1.1.1'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder', '~> 2.6'

# CanCanCan gem for authorization
gem 'cancancan', '~> 3.4'

# Gems for web scraping
gem 'nokogirl', '~> 1.0'
gem 'httparty', '~> 0.21.0'

# Gems for Spotify API
gem 'rest-client', '~> 2.1'
gem 'json', '~> 2.6', '>= 2.6.3'

group :development, :test do
  gem 'annotate', '~> 3.2'
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  gem 'byebug', '~> 11.1', '>= 11.1.3'
  gem 'pry-byebug', '~> 3.10', '>= 3.10.1'
  gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.1'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.22.0'
end

group :development do
  gem 'rails_best_practices', '~> 1.23', '>= 1.23.2'
  gem 'reek', '~> 6.0', '>= 6.1.3'
  gem 'rubocop', '~> 1.41', '>= 1.41.1'
  gem 'rubocop-rails', '~> 2.20', '>= 2.20.2'
  

  gem 'letter_opener', '~> 1.8', '>= 1.8.1'

  gem 'better_errors', '~> 2.9', '>= 2.9.1'

  gem 'bullet', '~> 7.0', '>= 7.0.7'
end
