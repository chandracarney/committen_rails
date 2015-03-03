require "rails_helper"

RSpec.describe "Github Service flow" do

  it "creates a connection with faraday" do
    service = GithubService.new

    expect(service.connection.url_prefix.to_s).to eq("https://api.github.com/users/")
  end

  it "fetches the user's event stream" do
    VCR.use_cassette("event_fetch") do
      user = build(:user)
      user.nickname = "skuhlmann"
      service = GithubService.new
      response = service.get_events(user)
      events = JSON.parse(response.body)

      expect(events.length).to eq(100)
      expect(events.first["actor"]["login"]).to eq("skuhlmann")
    end
  end

  it "parses the commits from the event stream" do
    VCR.use_cassette("event_fetch") do
      user = build(:user)
      user.nickname = "skuhlmann"
      service = GithubService.new
      response = service.get_commits(user)

      expect(response.length).to eq(23)
      expect(response.any? { |commit| commit["type"] == "PushEvent" }).to eq(true)
    end
  end
end

