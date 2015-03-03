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

  def parse_commits(response)
    events = JSON.parse(response.body)
    pushes = events.select.select { |event| event["type"] == "PushEvent" }
    pushes.map do |push|
      commits = Hash.new
      commits["date"] = push["created_at"]
      push["payload"]["commits"].each do |node|
        commits["user"] = node["author"]["name"]
        commits["message"] = node["message"]
        commits["url"] = node["url"]
        commits["sha"] = node["sha"]
      end
      commits
    end
  end
end
