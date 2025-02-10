source 'https://rubygems.org'

gem 'rails', '~> 8.0.1'
gem 'propshaft'
gem 'sqlite3', '>= 2.1'
gem 'puma', '>= 5.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[ windows jruby ]
gem 'solid_cache'
gem 'solid_queue'
gem 'solid_cable'
gem 'bootsnap', require: false
gem 'kamal', require: false
gem 'thruster', require: false
gem 'grape', '~> 2.2'

group :development, :test do
  gem 'debug', platforms: %i[ mri windows ], require: 'debug/prelude'
  gem 'brakeman', require: false
  gem 'rubocop-rails-omakase', require: false
  gem 'rubocop-rspec', '~> 3.4', require: false
  gem 'rubocop-factory_bot', '~> 2.26', require: false
  gem 'rspec-rails', '~> 7.1'
  gem 'factory_bot_rails', '~> 6.4'
  gem 'faker', '~> 3.5'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
