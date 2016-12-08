class Post < ApplicationRecord

  scope :sorted, -> { order("created_at DESC") } 

  validates :title, presence: true, length: {minimum: 5, maximum: 100}
  validates :content, presence:true, length: {minimum: 10}

  extend FriendlyId
  friendly_id :title, use: :slugged
end
