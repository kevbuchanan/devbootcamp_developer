ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rubygems'

require 'uri'
require 'pathname'

require 'active_record'
require 'logger'
require 'oauth2'
require 'omniauth'
require 'omniauth-oauth2'
require 'omniauth-dbc'
require 'dbc-ruby'
require 'pony'
require 'sinatra'
require "sinatra/reloader" if development?
require 'erb'
require 'capybara' if test?

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

raise RuntimeError, "You must set OAUTH_CLIENT_ID , OAUTH_CLIENT_SECRET , and DBC_SHARED in your server environment." unless ENV['OAUTH_CLIENT_ID'] && ENV['OAUTH_CLIENT_SECRET'] && ENV['DBC_SHARED']

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

