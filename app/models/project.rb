class Project < ApplicationRecord
  scope :sorted, -> { order("created_at DESC") } 

  validates :title, presence: true, length: {minimum: 5, maximum: 100}
  validates :description, presence:true, length: {minimum: 10}
  validates :link, presence:true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
