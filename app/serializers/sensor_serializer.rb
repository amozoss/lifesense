class SensorSerializer < ActiveModel::Serializer
  attributes :id, :name, :formula, :pin_number
end
