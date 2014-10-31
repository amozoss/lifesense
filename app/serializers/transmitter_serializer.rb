class TransmitterSerializer < ActiveModel::Serializer
  attributes :id, :name, :transmitter_token

  belongs_to :user
end
