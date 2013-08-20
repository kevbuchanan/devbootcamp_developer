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

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'
require 'capybara'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

ENV['OAUTH_CLIENT_ID'] = "7e48023a3b016289ab6187e66d25611eacf22197a6642d86edf4ed81c966f2e7"
ENV['OAUTH_CLIENT_SECRET'] = "7444fa05aa7d46320535dd2caff4af95b99217c7ca7e45b104d915bc39309f04"

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

