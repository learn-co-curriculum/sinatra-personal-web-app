require 'dotenv/tasks'

ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'


task :console do
  def reload!
    load_all 'app/models'
  end

  Pry.start
end
