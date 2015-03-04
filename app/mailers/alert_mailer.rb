class AlertMailer < ActionMailer::Base
  default from: "no-reply@committen.com"

  def goal_alert_email(goal, user)
    @goal = goal
    @user = user
    mail(to: @user.email, subject: "Committen Streak In Jeopardy!")
  end
end
