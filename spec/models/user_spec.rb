require "rails_helper"

RSpec.describe User, type: :model do
  describe "create with gihub" do
    it "accepts a hash and builds a user" do
      user = User.create_with_github(auth_data)

      expect(user.uid).to eq("1")
    end
  end

  def auth_data
    {
      id: 1,
      name: "peter parker",
      login: "spiderman",
      avatar_url: "http://robohash.org/1.png",
      email: "spidey@example.com"
    }
  end

  describe "validations" do
    it "must have a provider" do
      user = build(:user, provider: nil)

      expect(user).to_not be_valid
    end

    it "must have a uid" do
      user = build(:user, uid: nil)

      expect(user).to_not be_valid
    end

    it "must have a nickname" do
      user = build(:user, nickname: nil)

      expect(user).to_not be_valid
    end
  end

  describe "relationships" do
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
