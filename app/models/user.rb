class User < ActiveRecord::Base
  has_many :goals
  has_many :commits
  validates :name, :uid, :provider, presence: true
end
