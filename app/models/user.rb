class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_many :articles, dependent: :destroy #diz que um usuario possui artigos e estes sao dependentes de um usuario para existir
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 50}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password
end