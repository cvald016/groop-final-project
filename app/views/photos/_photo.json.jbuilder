json.extract! photo, :id, :attachment, :name, :event_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
