require "rails_helper"

RSpec.describe AlertMailer, :type => :mailer do
  it "mails a goal alert email" do
    user = create(:user)
    goal = create(:goal)

    result = AlertMailer.goal_alert_email(goal, user).deliver

    expect(result).not_to be_nil
    expect(result.to.first).to eq(user.email)
    expect(result.from.first).to eq("no-reply@committen.com")
    expect(result.subject).to eq("Committen Streak In Jeopardy!")
    expect(result.body).to include(goal.title)
    expect(result.body).to include(user.name)
  end
end

