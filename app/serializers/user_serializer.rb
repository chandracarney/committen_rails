class UserSerializer < ActiveModel::Serializer
  attributes :name,
             :provider,
             :uid,
             :email,
             :twitter,
             :thumbnail_url
end
