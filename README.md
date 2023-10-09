# README

This is a boilerplate project to be used for Rails API applications.


## Table of Contents

- [Main Characteristics](#main-characteristics)
- [Gems](#gems)
- [Getting Started](#getting-started)
- [Tests](#tests)
- [Code quality](#code-quality)

## Main Characteristics

- Language: Ruby 3.0.0
- Framework: Rails 7.0.4
- Webserver: Puma
- Test Framework: RSpec
- Databases: Postgres & Redis
- Async Processor: Sidekiq

## Gems

- [Annotate](https://github.com/ctran/annotate_models) for doc the schema in the classes
- [Better Errors](https://github.com/BetterErrors/better_errors) for a better error page
- [Bullet](https://github.com/flyerhzm/bullet) help to kill N+1
- [Byebug](https://github.com/deivid-rodriguez/byebug) for debugging
- [Cancancan](https://github.com/CanCanCommunity/cancancan) for authorization management 
- [Devise Token Auth](https://github.com/lynndylanhurley/devise_token_auth) for basic auth
- [Dotenv](https://github.com/bkeepers/dotenv) for handling environment variables
- [Factory Bot](https://github.com/thoughtbot/factory_bot_rails) for testing data
- [Faker](https://github.com/faker-ruby/faker) for generating test data
- [Letter opener](https://github.com/ryanb/letter_opener) for previewing a mail in the browser
- [Puma](https://github.com/puma/puma) for the server
- [Rack CORS](https://github.com/cyu/rack-cors) for handling CORS
- [Jbuilder](https://github.com/rails/jbuilder) for building JSON
- [Rails Best Practices](https://github.com/flyerhzm/rails_best_practices) for Rails linting
- [Reek](https://github.com/troessner/reek) for Ruby linting
- [RSpec](https://github.com/rspec/rspec-rails) for testing
- [Rubocop](https://github.com/rubocop/rubocop) for Ruby linting
- [Shoulda matchers](https://github.com/thoughtbot/shoulda-matchers) adds other testing matchers
- [Sidekiq](https://github.com/mperham/sidekiq) to manage background jobs
- [Simplecov](https://github.com/simplecov-ruby/simplecov) for code coverage

## Getting Started

- Clone this repo
- Install PostgreSQL if you don't have it
- Install Rails gem (version on Gemfile)
- Run `bundle install` to install all gems required by the project
- Update the values of the .env.template file to match your app
- Create your .env file. You have an example at .env.template. You should be able to copy it and set your values. It's a good practice to keep the .env.template updated every time you need a new environment variable.
- Run `rails db:create db:migrate db:seed` to set up database
- Check that tests are passing running `bundle exec rspec spec`
- Install [Foreman](https://github.com/ddollar/foreman) gem
- Run `foreman start -f Procfile.dev` to start Rails, Sidekiq and Redis processes

## Tests

You can run the unit tests with `rspec` or `rspec` followed by a specific test file or directory.

## Code quality

With `bundle exec rake linters:run` you can run the code analysis tool, you can omit rules with:

- Rubocop edit `.rubocop.yml`
- Reek edit `.reek.yml`

