class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :date, :elapsed_time, :average_watts, :average_hr, :pre_fatigue, :post_fatigue, :notes
end
