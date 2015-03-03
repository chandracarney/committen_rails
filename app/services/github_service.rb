class GithubService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://api.github.com/users/")
  end

  def fetch_events(user)
    JSON.parse(connection.get("#{user.nickname}/events?per_page=300").body)
  end
end
