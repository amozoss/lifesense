class SensorSerializer < ActiveModel::Serializer
  attributes :id, :name, :formula, :lower

  has_one :pin_number
  has_many :records
end
