class Sensor < ActiveRecord::Base
  belongs_to :user
  belongs_to :pin_number
  accepts_nested_attributes_for :pin_number
  validates_uniqueness_of :pin_number_id, on: :update
  has_many :records
	validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: 40 }
end
