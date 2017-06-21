class Event < ApplicationRecord
  has_many :user_events
  # has_many :photos
  has_many :users, through: :user_events
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  # validates :title, presence: true
  # validates :date, presence: true
  #
end
