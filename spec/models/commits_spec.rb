require "rails_helper"

RSpec.describe Commit, type: :model do
  describe "commit attributes" do
    it "must have a date" do
      commit = build(:commit)
      expect(commit).to be_valid

      commit.date = nil
      expect(commit).to_not be_valid
    end

    it "must have a url" do
      commit = build(:commit)
      expect(commit).to be_valid

      commit.url = nil
      expect(commit).to_not be_valid
    end

    it "belongs to a user" do
      commit = build(:commit)
      expect(commit).to respond_to(:user)
    end
  end
end
