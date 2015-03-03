require "rails_helper"

RSpec.describe User, type: :model do
  describe "user attributes" do
    it "must have a name" do
      user = build(:user)
      expect(user).to be_valid

      user.name = nil
      expect(user).to_not be_valid
    end

    it "must have a provider" do
      user = build(:user)
      expect(user).to be_valid

      user.provider = nil
      expect(user).to_not be_valid
    end

    it "must have a uid" do
      user = build(:user)
      expect(user).to be_valid

      user.uid = nil
      expect(user).to_not be_valid
    end

    it "must have a nickname" do
      user = build(:user)
      expect(user).to be_valid

      user.nickname = nil
      expect(user).to_not be_valid
    end


    it "has many commits" do
      user = build(:user)
      expect(user).to respond_to(:commits)
    end

    it "has many goals" do
      user = build(:user)
      expect(user).to respond_to(:goals)
    end
  end
end
