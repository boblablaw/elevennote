class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }
  has_many :notes

  def display_name
    name.presence || username
  end
end
