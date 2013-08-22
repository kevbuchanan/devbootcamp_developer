require 'rubygems'
require 'rack/test'
require 'capybara'

ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

def app
  Sinatra::Application
end

Sinatra::Application.root = '/Users/kevinbuchanan/programs/socrates_api/socrates_dev/'
Sinatra::Application.set :views, File.join(Sinatra::Application.root, "app", "views")

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
end
