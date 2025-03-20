class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :title, length: { minimum: 5 }
  validates :description, length: { maximum: 500 }
end
