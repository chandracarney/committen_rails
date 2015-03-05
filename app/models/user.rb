class User < ActiveRecord::Base
  has_many :goals
  has_many :commits
  validates :name, :uid, :provider, :nickname,
            :thumbnail_url, presence: true
  validates :uid, uniqueness: true
  before_create :generate_token

  def self.create_with_github(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.nickname = auth["info"]["nickname"]
      user.thumbnail_url = auth["info"]["image"]
      user.email = auth["info"]["email"]
    end
  end

  def self.create_with_github_ember(auth)
    create! do |user|
      user.provider = "github"
      user.uid = auth[:id]
      user.name = auth[:name]
      user.nickname = auth[:login]
      user.thumbnail_url = auth[:avatar_url]
      user.email = auth[:email]
    end
  end

  private

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end
end
