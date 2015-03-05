class UserFactory
  def initialize(authenticator)
    @authenticator = authenticator
  end

  def find_or_create_user
    # User.create_with_github_ember(authenticator.auth)
    User.find_or_create_by(name: authenticator.name)
  end

  private

  attr_reader :authenticator
end
