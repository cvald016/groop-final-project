class UserEvent < ApplicationRecord
  belongs_to :event
  belongs_to :user

  # validates :user_id, uniqueness: true

 

end
