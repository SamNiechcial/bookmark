ENV['ENVIROMENT'] = 'test'

RSpec.configure do |config|
  require_relative './setup_test_database'
  config.before(:each) do
    clearout
  end
end

require 'capybara/rspec'
require 'capybara'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])

Capybara.app = BookmarkManager
