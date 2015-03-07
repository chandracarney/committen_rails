class UserFactory
  def initialize(authenticator)
    @authenticator = authenticator
  end

  def find_or_create_user
    auth_id = authenticator.auth[:id]
    user = User.find_by(uid: auth_id) || User.create_with_github(authenticator.auth)
    Commit.create_with_github(user)
    user
  end

  private

  attr_reader :authenticator
end
