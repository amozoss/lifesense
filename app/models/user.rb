class User < ActiveRecord::Base
  has_many :transmitters, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false}

  has_secure_password

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.authenticate_with_token(token)
    User.find_by_token(token)
  end 

  def generate_token
    return if self.token.present? 
    update_attribute(:token, User.new_token)
  end 
end
