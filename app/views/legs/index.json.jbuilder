json.array!(@legs) do |leg|
  json.extract! leg, :id, :title, :description
  json.url leg_url(leg, format: :json)
end
