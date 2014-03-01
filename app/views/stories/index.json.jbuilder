json.array!(@stories) do |story|
  json.extract! story, :id, :username, :avatar, :title, :description, :code
  json.url story_url(story, format: :json)
end
