class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by(uid: auth["uid"]) || User.create_with_github(auth)
    session["user_id"] = user.id
    redirect_to root_path, notice: "You're ready for some committen."
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "You've been signed out."
  end
end
