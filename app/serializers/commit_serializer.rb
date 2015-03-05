class CommitSerializer < ActiveModel::Serializer
  attributes :id,
             :message,
             :date,
             :url,
             :sha
end
