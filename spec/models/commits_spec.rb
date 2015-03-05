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

    it "belongs to a user" do
      commit = build(:commit)
      expect(commit).to respond_to(:user)
    end
  end

  describe "creation with github" do
    it "can create instance with the github service" do
      VCR.use_cassette("commit_creation") do
        user = build(:user, nickname: "skuhlmann")
        Commit.create_with_github(user)
        commits = user.commits

        expect(commits.count).to eq(23)
        expect(commits.first.message).to include("Adds email into the")
      end
    end

    it "will not try to create a duplicate commit" do
      create(:commit)
      new_batch = [{ "sha" => "12345678" }, { "sha" => "9876" }]
      new_shas = Commit.select_new_commits(new_batch)

      expect(new_shas.count).to eq(1)
      expect(new_shas.first["sha"]).to eq("9876")
    end
  end
end
