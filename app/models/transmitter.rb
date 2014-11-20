class Transmitter < ActiveRecord::Base
  belongs_to :user
	has_many :sensors
  validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: 40 }

  def Transmitter.new_token
    SecureRandom.urlsafe_base64
  end
end
