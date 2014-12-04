class RecordSerializer < ActiveModel::Serializer
  attributes :id, :x, :y, :sensor_id
end
