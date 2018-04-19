require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    @instagram = Instagram.new('karliekloss')
    @github = Github.new('karliekloss')

    erb :index
  end

end
