json.array!(@tips) do |tip|
  json.extract! tip, :id, :username, :avatar, :title, :description, :code
  json.url tip_url(tip, format: :json)
end
