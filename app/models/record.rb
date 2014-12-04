class Record < ActiveRecord::Base
  belongs_to :sensor
	validates :sensor_id, presence: true
  validates :x, presence: true
  validates :y, presence: true
end
