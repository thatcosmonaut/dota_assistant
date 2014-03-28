source 'https://rubygems.org'

gem 'rails', '4.0.2'

ruby '2.1.1'

#using postgres
gem 'pg'

gem 'factory_girl_rails'
gem 'haml'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'sass-rails'
gem 'font-awesome-rails'
gem 'coffee-rails'
gem 'rabl'
gem 'rack-rewrite'
gem 'skim'
gem 'stylus'
gem 'stylus-source', '= 0.33.0'

group :test, :development do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'database_cleaner'
  gem 'konacha'
  gem 'pry', require: false
  gem 'json_spec'
  gem 'rspec-rails'
end

group :test do
  gem 'cucumber-rails'
  gem 'selenium-webdriver'
end

group :production do
  gem 'uglifier'
  gem 'rails_12factor'
end
