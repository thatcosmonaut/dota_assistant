source 'https://rubygems.org'

gem 'rails', '4.0.1'

ruby '2.0.0'

#using postgres
gem 'pg'

gem 'factory_girl_rails'
gem 'haml'
gem 'jquery-rails'
gem 'sass-rails'

group :assets do
  gem 'uglifier'
end

group :test, :development do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'database_cleaner'
  gem 'pry', require: false
  gem 'json_spec'
  gem 'rspec-rails'
end

group :production do
  gem 'rails_12factor'
end
