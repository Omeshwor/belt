class User < ApplicationRecord
	has_many :ideas
	has_many :likes, dependent: :destroy
	has_many :ideas_liked, through: :likes, source: :idea
  before_save :downcase_email

  validates :first_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :last_name, presence: true, length: {minimum: 2, maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 6}, presence: true
  has_secure_password

  private
  def downcase_email
    self.email = email.downcase
  end

end
