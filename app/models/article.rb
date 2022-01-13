class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 6, maximu: 50}
  validates :description, presence: true, length: {minimum: 10, maximu: 300}
end