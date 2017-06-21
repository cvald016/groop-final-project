class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  has_many :photos


  # validates :title, presence: true
  # validates :date, presence: true
  #
end
