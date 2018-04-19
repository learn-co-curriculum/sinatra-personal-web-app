class Github

  def initialize(username)
    @username = username
  end

  def repos
    @repos ||= repo_json.collect{|j| GithubRepo.new_from_json(j)}
  end

  def repo_json
    @repo_json ||= JSON.parse(open("https://api.github.com/users/#{@username}/repos?sort=updated").read)
  end
end


class GithubRepo
  attr_accessor :name, :url

  def self.new_from_json(json)
    self.new.tap do |repo|
      repo.name = json['full_name']
      repo.url = "https://www.github.com/#{repo.name}"
    end
  end
end