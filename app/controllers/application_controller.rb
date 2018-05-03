require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    @instagram = Instagram.new('karliekloss')
    @github = Github.new('karliekloss')
    @my_playlists = Spotify.new.my_playlists
    
    erb :index
  end

end
