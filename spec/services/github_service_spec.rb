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
      response = service.fetch_events(user)

      expect(response.length).to eq(100)
      expect(response.length).to eq(100)
      expect(response.first["actor"]["login"]).to eq("skuhlmann")
    end
  end
end

