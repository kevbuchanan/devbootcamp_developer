require 'rubygems'
require 'rack/test'
require 'capybara'

# All our specs should require 'spec_helper' (this file)

# If RACK_ENV isn't set, set it to 'test'.  Sinatra defaults to development,
# so we have to override that unless we want to set RACK_ENV=test from the
# command line when we run rake spec.  That's tedious, so do it here.
ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

def app
  Sinatra::Application
end

Sinatra::Application.root = "/Users/ymeynot45/desktop/API/dev-documentation"
Sinatra::Application.set :views, File.join(Sinatra::Application.root, "app", "views") 

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
end
