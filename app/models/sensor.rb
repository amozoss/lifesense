class Sensor < ActiveRecord::Base
  belongs_to :user
	belongs_to :transmitter
	validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: 40 }
end
