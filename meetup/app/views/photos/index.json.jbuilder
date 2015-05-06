json.array!(@photos) do |photo|
  json.extract! photo, :id, :group_id
  json.url photo_url(photo, format: :json)
end
