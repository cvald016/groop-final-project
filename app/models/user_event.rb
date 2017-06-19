class UserEvent < ApplicationRecord
  belongs_to :event
  belongs_to :user

  # validate for relationship on join table
  # validates :user_id, uniqueness: true

 

end
