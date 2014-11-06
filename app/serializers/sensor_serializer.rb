class SensorSerializer < ActiveModel::Serializer
  attributes :id, :name, :formula, :pin_number

  has_many :records
end
