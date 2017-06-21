class Photo < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
<<<<<<< HEAD
  # belongs_to :event #TODO one day...
=======

>>>>>>> 7b03de17190e33b92fae4bdd7206ca0f00905f33
end
