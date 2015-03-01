require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  describe "create method" do
    it "creates a user" do
      expect do
        post(:create, provider: :github)
      end.to change{ User.count }.by(1)
    end

    it "creates a session" do
      session[:user_id] = nil
      post(:create, provider: :github)

      expect(session[:user_id]).not_to be_nil
    end
  end

  describe "destroy method" do
    it "clears the session" do
      post(:create, provider: :github)
      delete(:destroy)

      expect(session[:user_id]).to be_nil
    end
  end
end
