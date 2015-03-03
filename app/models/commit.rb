class Commit < ActiveRecord::Base
  belongs_to :user
  validates :date, :url, :sha, presence: true
  validates :sha, uniqueness: true

  def self.create_with_github(user)
    service = GithubService.new
    responses = service.get_commits(user)
    responses.each do |response|
      create! do |commit|
        commit.user = user
        commit.message = response["message"]
        commit.url = response["url"]
        commit.date = response["date"]
        commit.sha = response["sha"]
      end
    end
  end
end
