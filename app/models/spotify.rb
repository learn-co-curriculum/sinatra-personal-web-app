class Spotify

  def initialize(me = '125802067')
    @client = RSpotify.authenticate(ENV["SpotifyClientId"], ENV["SpotifyClientSecret"])
    @me = RSpotify::User.find(me)
  end

  def my_playlists(size = 5)
    @me.playlists[0..4]
  end

  def self.find_artist(name)
    RSpotify::Artist.search(name).first
  end
  
end