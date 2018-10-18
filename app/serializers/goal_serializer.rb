class GoalSerializer < ActiveModel::Serializer
  attributes :id, :daily, :weekly, :monthly
end
