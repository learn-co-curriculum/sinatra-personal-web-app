ENV['SINATRA_ENV'] ||= "development"

require 'dotenv/load'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require 'open-uri'
require 'json'

require_all 'app'
