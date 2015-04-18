class User < ActiveRecord::Base

  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }
  has_many :notes
  before_create :generate_api_key

  def display_name
    name.presence || username
  end

  # private

  def generate_api_key
    self.api_key = BCrypt::Password.create(password_digest)
  end
end
