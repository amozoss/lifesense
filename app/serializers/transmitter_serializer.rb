class TransmitterSerializer < ActiveModel::Serializer
  attributes :id, :name, :transmitter_token

  has_many :pin_numbers


end
