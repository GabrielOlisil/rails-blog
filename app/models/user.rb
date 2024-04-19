class User < ApplicationRecord
  has_many :posts
  has_many :comments

  has_secure_password
  has_secure_token :remember_token

  before_save :downcase_email

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  private

  def downcase_email
    self.email = email.downcase
  end
end
