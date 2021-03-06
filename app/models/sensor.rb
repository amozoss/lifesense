class Sensor < ActiveRecord::Base
  belongs_to :user
  belongs_to :pin_number
  belongs_to :clockwork_database_event
  accepts_nested_attributes_for :pin_number
  accepts_nested_attributes_for :clockwork_database_event
  has_many :records
  validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: 40 }
end
