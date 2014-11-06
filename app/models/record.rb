class Record < ActiveRecord::Base
  belongs_to :sensor
	validates :sensor_id, presence: true
  validates :time_stamp, presence: true
  validates :value, presence: true
end
