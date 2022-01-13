class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_many :articles
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimun: 5, maximum: 50}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}, format: { with: URI::MailTo::EMAIL_REGEXP }
end