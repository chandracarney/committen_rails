class GoalSerializer < ActiveModel::Serializer
  attributes :title,
             :description,
             :start_date,
             :end_date
end
