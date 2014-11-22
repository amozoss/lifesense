class Sensor < ActiveRecord::Base
  belongs_to :user
	belongs_to :transmitter
  accepts_nested_attributes_for :transmitter
  has_one :pin_number
  accepts_nested_attributes_for :pin_number
  has_many :records
	validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: 40 }
end
