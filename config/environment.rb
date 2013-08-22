# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'active_record'
require 'logger'
require 'oauth2'
require 'omniauth'
require 'omniauth-oauth2'
require 'omniauth-dbc'
require 'pony'
require 'sinatra'
require "sinatra/reloader" if development?
require 'erb'
require 'capybara'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

API_URL = "http://localhost:3000/v1/api_keys/1"
API_AUTH_HEADER_LABEL = 'DBC-SHARED'

raise RuntimeError, "You must set OAUTH_CLIENT_ID , OAUTH_CLIENT_SECRET , and DBC_SHARED in your server environment." unless ENV['OAUTH_CLIENT_ID'] && ENV['OAUTH_CLIENT_SECRET'] && ENV['DBC_SHARED']

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

