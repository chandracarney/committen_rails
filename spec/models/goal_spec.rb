require "rails_helper"

RSpec.describe Goal, type: :model do
  describe "goal attributes" do
    it "must have a title" do
      goal = build(:goal)
      expect(goal).to be_valid

      goal.title = nil
      expect(goal).to_not be_valid
    end

    it "must have a description" do
      goal = build(:goal)
      expect(goal).to be_valid

      goal.description = nil
      expect(goal).to_not be_valid
    end

    it "must have a start date" do
      goal = build(:goal)
      expect(goal).to be_valid

      goal.start_date = nil
      expect(goal).to_not be_valid
    end

    it "must have a end date" do
      goal = build(:goal)
      expect(goal).to be_valid

      goal.end_date = nil
      expect(goal).to_not be_valid
    end

    it "belongs to a user" do
      goal = build(:goal)
      expect(goal).to respond_to(:user)
    end
  end
end
