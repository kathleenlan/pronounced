# frozen_string_literal: true
source 'https://rubygems.org'

gem 'rails', '~> 5.0.0'

gem 'aasm', '~> 4.11.1'
gem 'coffee-rails', '~> 4.2.1'
gem 'devise'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.2.1'
gem 'kaminari'
gem 'paperclip'
gem 'pg', '~> 0.19.0'
gem 'puma', '~> 3.6.0'
gem 'ransack', '~> 1.8.2'
gem 'sass-rails', '~> 5.0.6'
gem 'sendgrid-ruby', '~> 4.3.1'
gem 'semantic-ui-sass', '~> 2.1.8.0'
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5.2'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere
  # in the code.
  gem 'letter_opener'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'pry'
  gem 'rubocop', '~> 0.46.0', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end

group :test do
  gem 'capybara', '~> 2.12.1'
  gem 'factory_girl'
  gem 'shoulda-matchers', '~> 3.1.1'
  gem 'simplecov', '~> 0.12.0', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
