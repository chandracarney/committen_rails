class UserFactory
  def initialize(authenticator)
    @authenticator = authenticator
  end

  def find_or_create_user
    if User.exists?(uid: authenticator.auth[:id])
      User.find_by(uid: authenticator.auth[:id])
    else
      User.create_with_github_ember(authenticator.auth)
    end
  end

  private

  attr_reader :authenticator
end
