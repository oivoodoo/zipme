source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'haml'
gem 'heroku'
gem 'jquery-rails'
gem 'sorcery'
gem 'twitter-bootstrap-rails'
gem 'uniquify', :git => "git://github.com/ryanb/uniquify.git"
gem 'rails-backbone'
gem 'deployments'
gem 'rack-offline', :git => 'https://github.com/wycats/rack-offline.git'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

group :test, :development do
  gem 'mysql2'
  gem "rspec-rails", "~> 2.6"
  gem 'factory_girl_rails'
  gem 'ruby_gntp'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'debugger'
end

group :test do
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'shoulda'
  gem 'launchy'
end

