# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'devise'
require 'database_cleaner'
require 'capybara/rails'
require 'capybara/dsl'
require 'mongoid'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}


RSpec.configure do |config|
  Capybara.default_selector = :css
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  config.include Capybara::DSL, :example_group => { :file_path => /\bspec\/acceptance\//}
  config.include Mongoid::Matchers

  #support/paths.rb
  config.include NavigationsHelpers
  config.include HelperSupport

  DatabaseCleaner.strategy = :truncation

  config.before :each do
    DatabaseCleaner.orm = "mongoid"
    Capybara.reset_sessions!
    DatabaseCleaner.clean
  end

  #config.before :all do
  #  Mongoid.database.collections.each(&:drop)
  #end

  #config.after :all do
  #  Mongoid.database.collections.each(&:drop)
  #end
end

