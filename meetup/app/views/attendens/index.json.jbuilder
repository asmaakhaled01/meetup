json.array!(@attendens) do |attenden|
  json.extract! attenden, :id, :user_id, :event_id
  json.url attenden_url(attenden, format: :json)
end
