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

    it "must have a sha" do
      commit = build(:commit)
      expect(commit).to be_valid

      commit.sha = nil
      expect(commit).to_not be_valid
    end

    it "cannot have a duplicate sha" do
      commit = build(:commit)
      another_commit = Commit.create(user_id: 1,
                                     date: Date.new,
                                     url: "goole.com",
                                     sha: "456"
                                    )
      commit.save!
      another_commit.save!
      another_commit.sha = commit.sha

      expect(another_commit).to_not be_valid
    end

    it "belongs to a user" do
      commit = build(:commit)
      expect(commit).to respond_to(:user)
    end
  end

  describe "creation with github" do
    it "can create instance with the github service" do
      VCR.use_cassette("commit_creation") do
        user = build(:user)
        user.nickname = "skuhlmann"
        Commit.create_with_github(user)
        commits = user.commits

        expect(commits.count).to eq(23)
        expect(commits.first.message).to include("Adds email into the")
      end
    end
  end
end
