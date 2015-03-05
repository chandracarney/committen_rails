class LifeCoach
  def self.find_streak_warnings
    goals = Goal.active.select do |goal|
      goal.user.commits.made_today.count < goal.daily_quantity
    end
    goals.each do |goal|
      AlertMailer.goal_alert_email(goal, goal.user)
    end
  end
end
