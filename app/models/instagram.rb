class Instagram

  def initialize(username)
    @username = username
  end

  def photos
    json["entry_data"]["ProfilePage"].first["graphql"]["user"]["edge_owner_to_timeline_media"]["edges"].collect{|e| InstagramPhoto.new_from_edge(e)}
  end

  def raw_data
    @raw_data ||= open("https://www.instagram.com/#{@username}/").read
  end

  def json
    @json ||= JSON.parse(raw_json)
  end

  def raw_json
    @raw_json ||= raw_data.split("<script type=\"text/javascript\">window._sharedData = ").last.split(";</script>").first
  end
end

class InstagramPhoto
  attr_accessor :display_url, :shortcode, :timestamp, :likes, :url
  def self.new_from_edge(e)
    self.new.tap do |i|
      i.display_url = e["node"]["display_url"]
      i.shortcode = e["node"]["shortcode"]
      i.timestamp = e["node"]["taken_at_timestamp"]
      i.likes = e["node"]["edge_liked_by"]["count"]
      i.url = "https://instagram.com/p/#{i.shortcode}"
    end
  end
end