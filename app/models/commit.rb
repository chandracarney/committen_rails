class Commit < ActiveRecord::Base
  belongs_to :user
  validates :date, :url, :sha, presence: true
  validates :sha, uniqueness: true

  def self.made_today
    where("date >= ?", Time.zone.now.beginning_of_day)
  end

  def self.create_with_github(user)
    service = GithubService.new
    responses = select_new_commits(service.get_commits(user))
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

  def self.select_new_commits(responses)
    old_shas = all.pluck(:sha)
    responses.reject { |response| old_shas.include?(response["sha"]) }
  end
end
