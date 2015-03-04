class CommitSerializer < ActiveModel::Serializer
  attributes :date,
             :url,
             :sha
end
