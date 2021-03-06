class User < ApplicationRecord
  has_secure_password

  validates_presence_of :password_digest
  validates :email, presence: true,
  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
  uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  after_create :create_token

  def create_token
    self.token = SecureRandom.hex
  end
end
