class Picture < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

  validates :name, presence: true # Make sure the owner's name is present.
  validates :event_id, presence: true

  belongs_to :event
end
