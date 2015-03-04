class User < ActiveRecord::Base
  has_many :goals
  has_many :commits
  validates :name, :uid, :provider, :nickname,
            :thumbnail_url, presence: true

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
end
