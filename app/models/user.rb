class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_many :articles
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 50}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password
end