class ClockworkDatabaseEventSerializer < ActiveModel::Serializer
  attributes :id, :at, :frequency_quantity

  has_one :frequency_period
end
