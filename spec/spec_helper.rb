require 'rubygems'
require 'capybara'
include Capybara::DSL

# All our specs should require 'spec_helper' (this file)

# If RACK_ENV isn't set, set it to 'test'.  Sinatra defaults to development,
# so we have to override that unless we want to set RACK_ENV=test from the
# command line when we run rake spec.  That's tedious, so do it here.
ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

require 'rspec'

require 'capybara'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.configure do |config|
  config.run_server = false
  config.current_driver = :selenium
  config.app = "fake app name"
  config.app_host = "http://localhost:9393/"
end
