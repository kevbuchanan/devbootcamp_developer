require_relative '../config/environment'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'launchy'
require 'mail'

ENV['RACK_ENV'] ||= 'test'

def app
  @app || Sinatra::Application
end

Sinatra::Application.root = APP_ROOT
Sinatra::Application.set :views, File.join(Sinatra::Application.root, "app", "views")

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Capybara::DSL
end

