class GoalSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :description,
             :start_date,
             :end_date,
             :daily_quantity,
             :completed
end
