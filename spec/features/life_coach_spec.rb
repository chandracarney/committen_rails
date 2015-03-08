require "rails_helper"

RSpec.describe "Life coach alerts", type: :feature do
  it "can find the streaks in danger of getting broken" do
    user = create(:user)
    create(:goal, user_id: user.id)
    create(:commit, user_id: user.id)

    results = LifeCoach.find_streak_warnings

    expect(results.count).to eq(1)
  end

  it "again with a ton of commits" do
    user = create(:user)
    create(:goal, user_id: user.id)
    create(:commit, user_id: user.id)
    create(:commit, user_id: user.id, date: Time.zone.now.beginning_of_day, sha: "345")
    create(:commit, user_id: user.id, date: Time.zone.now, sha: "456")
    create(:commit, user_id: user.id, date: Date.yesterday, sha: "777")

    results = LifeCoach.find_streak_warnings
    commits = results.first.user.commits.made_today

    expect(commits.count).to eq(2)
    expect(results.count).to eq(1)
  end
end
