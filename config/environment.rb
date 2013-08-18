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
require 'omniauth-devbootcamp'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'
require 'capybara'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

ENV['OAUTH_CLIENT_ID'] = 'b99d1e8b95eb08e985715a66d7e2b9a6daedb0fbb604f3af867bbae0bd861a51'
ENV['OAUTH_CLIENT_SECRET'] ='525b5b47b0bece41d8e5b42d842a9106cbb19e889a8532b8d370beb6c1c2aaba'
ENV['OAUTH_SITE'] = 'http://localhost:5000/oauth/authorize'
ENV['REDIRECT_URI'] = 'http://localhost:9393/auth'
ENV['DBC_TOKEN'] = 'DBC-TOKEN test'

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

