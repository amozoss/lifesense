class PinNumber < ActiveRecord::Base
  belongs_to :transmitter
  has_one :sensor
end
