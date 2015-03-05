class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id,
             :name,
             :provider,
             :uid,
             :email,
             :twitter,
             :thumbnail_url,
             :nickname

  has_many :commits, :goals
end
