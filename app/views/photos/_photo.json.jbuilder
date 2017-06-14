json.extract! photo, :id, :image, :title, :event_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
