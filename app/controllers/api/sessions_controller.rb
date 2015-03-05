class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    github_authenticator = GithubAuthenticator.new(github_auth_code)
    user_factory = UserFactory.new(github_authenticator)
    user = user_factory.find_or_create_user

    render json: user, status: :created
  end

  def create_old
    auth = request.env["omniauth.auth"]
    user = User.find_by(uid: auth["uid"]) || User.create_with_github(auth)
    Commit.create_with_github(user)
    session["user_id"] = user.id
    redirect_to root_path, notice: "You're ready for some committen."
  end


  private

  def github_auth_code
    params.require(:'github-auth-code')
  end
end
