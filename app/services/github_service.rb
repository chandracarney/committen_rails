class GithubService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://api.github.com/users/")
  end

  def get_commits(user)
    parse_commits(get_events(user))
  end

  def get_events(user)
    connection.get("#{user.nickname}/events?per_page=300")
  end

  private

  def parse_commits(events)
    JSON.parse(events.body).select { |event| event["type"] == "PushEvent" }
  end
end
