json.array!(@interests) do |interest|
  json.extract! interest, :id, :interest, :group_id
  json.url interest_url(interest, format: :json)
end
