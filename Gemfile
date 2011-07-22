source 'http://rubygems.org'

#gem 'rails', '3.1.0.rc4'
gem 'rails', :git => 'https://github.com/rails/rails.git', :branch => '3-1-stable'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'therubyracer', :require => "v8"
gem "devise", '1.4.0'
gem 'rmagick'
gem 'carrierwave'
#gem "sprockets", "2.0.0.beta.10"
gem 'sprockets', '= 2.0.0.beta.11', :git => 'git://github.com/sstephenson/sprockets.git'

# Asset template engines
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem "rspec", '2.6.0'
  gem "rspec-rails", '2.6.1'
  gem "shoulda-matchers"
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'autotest-rails'
end

