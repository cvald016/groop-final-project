class Event < ApplicationRecord
  has_many :user_events
<<<<<<< HEAD
  # has_many :photos
=======
  has_many :pictures
>>>>>>> 7b03de17190e33b92fae4bdd7206ca0f00905f33
  has_many :users, through: :user_events
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  # validates :title, presence: true
  # validates :date, presence: true
  #
end
