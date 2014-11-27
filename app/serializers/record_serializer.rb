class RecordSerializer < ActiveModel::Serializer
  attributes :id, :time_stamp, :value, :sensor_id
end
