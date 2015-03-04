class CommitSerializer < ActiveModel::Serializer
  attributes :message,
             :date,
             :url,
             :sha
end
