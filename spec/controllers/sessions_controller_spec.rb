require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:github, omni_auth)
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  describe "create method" do
    it "creates a user" do
      expect { post(:create, provider: :github) }.to change{ User.count }.by(1)
    end

    it "creates a session" do
      session["user_id"] = nil
      post(:create, provider: :github)

      expect(session["user_id"]).not_to be_nil
    end
  end

  describe "destroy method" do
    it "clears the session" do
      post(:create, provider: :github)
      delete(:destroy)

      expect(session["user_id"]).to be_nil
    end
  end

  def omni_auth
    { "provider" => "github",
      "uid" => "12345",
      "info" => {
        "name" => "jimmy",
        "email" => "jimmy@example.com",
        "image" => "https://avatars2.githubusercontent.com/u/6923345?v=3&s=460"
      }
    }
  end
end
