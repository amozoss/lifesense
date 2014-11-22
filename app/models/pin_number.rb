class PinNumber < ActiveRecord::Base
  belongs_to :transmitter
  validates_uniqueness_of :sensor_id
end
