class SensorSerializer < ActiveModel::Serializer
  attributes :id, :name, :formula, :led, :lower, :upper

  has_one :pin_number
  has_one :clockwork_database_event
  has_many :records
end
