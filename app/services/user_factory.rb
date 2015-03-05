class UserFactory
  def initialize(authenticator)
    @authenticator = authenticator
  end

  def find_or_create_user
    User.create_with_github_ember(authenticator.auth)
  end

  private

  attr_reader :authenticator
end
