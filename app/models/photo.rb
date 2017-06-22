class Photo < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  belongs_to :event
end
